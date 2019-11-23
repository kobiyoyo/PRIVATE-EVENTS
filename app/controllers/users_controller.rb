# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
       @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.future_events 
    @past_events = @user.attended_events.past_events 
    @created_events  = @user.hosted_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'You have signed up.'
      redirect_to @user
    else
      flash.now[:danger] = 'Please fill all fields'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Your information has been updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'This user has been deleted.'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
   
  def set_user
  
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = 'You are not authorized.'
      redirect_to root_path
    end
  end
end
