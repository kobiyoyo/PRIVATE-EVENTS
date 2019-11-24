# frozen_string_literal: true

class InvitationsController < ApplicationController
  before_action :logged_in_user
  before_action :different_user, only: :new

  def show
    invitations = current_user.received_invitations
    @events = []
    invitations.each do |invitation|
      @events << Event.find(invitation.event_id)
    end
  end

  def new
    @invitation = current_user.sent_invitations.new
    @user = User.find(params[:user_id])
    @invitation.invited = @user

    @possible_events = [] # move logic to Model?
    current_user.hosted_events.each do |event|
      @possible_events << event unless @user.attended_events.include?(event)
    end
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @user = User.find(params[:invitation][:invited_id])
    if @invitation.save
      flash[:success] = 'Your invitation has been sent.'
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @invitation = Invitation.find_by(invited_id: current_user.id, event_id: params[:event_id])
    @invitation.destroy
    if params[:accept] == 'true'
      redirect_to attend_path(event_id: params[:event_id], user_id: current_user.id)
    else
      redirect_to notifications_path
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invited_id, :inviter_id, :event_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:info] = 'You must be logged in to do that.'
      redirect_to login_path
    end
  end

  def different_user
    user = User.find(params[:user_id])
    if current_user == user
      flash[:info] = "You can't invite yourself to events!"
      redirect_to root_path
    end
  end
end
