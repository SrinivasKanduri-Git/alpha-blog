# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: %i[edit update destroy]
  before_action :require_same_user, except: %i[show index]

  def show
    @articles = @user.articles.page(params[:page])
  end

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserActionsMailer.new_signup_action(@user).deliver_now
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to AlphaBlog #{@user.username}, your account created successfully."
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account information updated.'
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = 'The user and all associated articles have been deleted'
    redirect_to signup_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :picture)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return if current_user == @user

    UserActionsMailer.unauthorized_action(@user).deliver_now
    flash[:alert] = 'Unauthorized action!!'
    redirect_to users_path
  end
end
