class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :set_user, except: [:new, :create]

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

  def show

  end

  private

  def set_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "please_log_in"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
