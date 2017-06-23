class ProductsController < ApplicationController
  include ProductLib
  before_action :load_category, only: [:index]

  def index
    if params[:filter]
      @products = filter_products(params[:filter])
        .select(:id, :name, :description, :image, :price, :category_id)
        .page(params[:page]).per Settings.per_page
    else
      @products = Product.search(params[:search])
        .select(:id, :name, :description, :image, :price, :category_id)
        .page(params[:page]).per Settings.per_page
    end
  end

  def show
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "flash.warning.not_found_product"
    redirect_to root_url
  end

  private

  def load_category
    @categories = Category.all
    return if @categories
    flash[:warning] = t "flash.warning.category_warning"
    redirect_to admin_products_path
  end
end
