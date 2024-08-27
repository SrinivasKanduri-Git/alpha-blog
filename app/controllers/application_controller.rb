# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'Unauthorized action!!'
    redirect_to login_path
  end

  private

  def record_not_found
    render file: Rails.root.join('public', '404.html'), status: 404, layout: false
  end
end
