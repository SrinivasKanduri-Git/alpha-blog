# frozen_string_literal: true

class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Login successful!'
      redirect_to user
    else
      flash.now[:alert] = 'email or password is incorrect'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'logged out successfully.'
    redirect_to root_path
  end
end
