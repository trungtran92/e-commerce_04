class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def show
    @products = @category.products.order_newest
      .page(params[:page]).per Settings.per_pages
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "category.not_found"
    redirect_to products_path
  end
end
