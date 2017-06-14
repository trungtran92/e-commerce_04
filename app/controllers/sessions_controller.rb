class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t "Login_fail"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t "logout_success"
    redirect_to login_path
  end
end
