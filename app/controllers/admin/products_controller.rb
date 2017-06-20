class Admin::ProductsController < ApplicationController
  included Admin::AdminHelper
  before_action :verify_admin
  before_action :load_product, except: [:index, :new, :create]
  before_action :load_category, except: [:destroy]

  def index
    @products = Product.select(:id, :name, :description, :price,
      :category_id, :image, :quantity).order(:name)
      .includes(:products).page(params[:page]).per(Settings.per_page)
  end

  def new
    @product = Product.new
  end

  def show; end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "flash.success.create_product_success"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t "flash.danger.create_product_fail"
      render new_admin_product_path
    end
  end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "flash.success.update_product_success"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t "flash.danger.update_product_fail"
      render :edit
    end
  end

  def destroy
    if @product.order_details.any?
      flash[:danger]= t "products.cant_delete_product"
    else
      if @product.destroy
        flash[:success] = t "flash.success.destroy_product_success"
      else
        flash[:danger] = t "flash.danger.destroy_product_fail"
      end
    end
    redirect_to admin_products_path
  end

  private

  def product_params
   params.require(:product).permit :name, :description, :price, :quantity,
     :image, :category_id
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "products.no_product"
    redirect_to admin_products_path
  end

  def load_category
    @categories = Category.all
    return if @categories
    flash[:warning] = t "flash.warning.category_warning"
    redirect_to admin_products_path
  end
end
