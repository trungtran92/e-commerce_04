class Admin::UsersController < ApplicationController
  included Admin::AdminHelper
  before_action :verify_admin
  before_action :load_user, only: :destroy

  def index
    @users = User.select(:id, :name, :email, :is_admin,
      :created_at).order(:name)
      .paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.user_deleted"
    else
      flash[:notice] = t "users.user_not_deleted"
    end
    redirect_to admin_user_path
  end
end
