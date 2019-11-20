# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = 'Logged in.'
      redirect_to @user
    else
      flash.now[:warning] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out current_user
    flash[:success] = 'Logged out.'
    redirect_to root_path
  end
end
