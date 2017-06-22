class Admin::SuggestsController < ApplicationController

  before_action :load_suggest, only: [:update]
  def index
    @suggests = Suggest
      .select(:id, :user_id, :product_name,
      :product_description, :status, :created_at).order(created_at: :desc)
      .page(params[:page]).per(Settings.per_page)
  end

  def update
    if @suggest.update_attributes status: params[:value]
      flash[:success] = t "suggests.update_success"
    else
      flash[:danger] = t "suggests.update_fail"
    end
    redirect_to admin_suggests_path
  end

  private

  def load_suggest
    @suggest= Suggest.find_by id: params[:id]
    return if @suggest
    flash[:danger] = t "suggest.no_suggest"
    redirect_to admin_suggests_path
  end
end
