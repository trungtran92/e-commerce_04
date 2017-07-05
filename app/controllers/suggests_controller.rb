class SuggestsController < ApplicationController
  before_action :require_login

  def new
    @suggests = Suggest.new
  end

  def create
    @suggest = Suggest.new suggest_params
    @suggest.user =  current_user
    if @suggest.save
      flash[:success] = t "flash.success.create_suggest_success"
      redirect_to  root_path
    else
      flash.now[:danger] = t "flash.danger.create_suggest_fail"
      render :new
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :product_name, :product_description
  end
end
