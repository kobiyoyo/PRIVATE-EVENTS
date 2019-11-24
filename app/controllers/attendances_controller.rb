# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :create
  before_action :correct_user_or_event_creator, only: :destroy

  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @event.attendees.delete(@user)
    redirect_to @event
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:info] = 'You must be logged in to do that.'
      redirect_to login_path
    end
  end

  def correct_user_or_event_creator
    unless correct_user || event_creator
      flash[:warning] = 'You are not authorized.'
      redirect_to root_path
    end
  end

  def correct_user
    user = User.find(params[:user_id])
    current_user == user
  end

  def event_creator
    creator = Event.find(params[:event_id]).creator
    current_user == creator
  end
end
