class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "please_log_in"
    redirect_to root_url
  end

  def verify_admin
    return if current_user.is_admin
    flash[:danger] = t "flash.danger.user_not_admin"
    redirect_to root_url
  end
end
