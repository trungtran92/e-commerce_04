class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_login
    return if logged_in?
    flash[:danger] = t "please_log_in"
    redirect_to login_path
  end
end
