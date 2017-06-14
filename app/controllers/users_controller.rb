class UsersController < ApplicationController
  before_action :logged_in_user, except: [:show, :new, :create]
  before_action :require_login, only: :show
  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "Register_success"
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
