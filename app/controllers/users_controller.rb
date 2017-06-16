class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t "flash.success.register_success"
      redirect_to users_path
    else
      flash.now[:danger] = t "flash.danger.register_failed"
      render :new
    end
  end

  def show;  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "flash.success.profile_updated_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def require_login
    return if logged_in?
    flash[:danger] = t "please_log_in"
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
