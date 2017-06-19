class  Admin::CategoriesController < ApplicationController
  included Admin::AdminHelper
  before_action :verify_admin
  before_action :load_category, except: [:index, :new, :create]

  def index
    @categories = Category.select(:id, :name).order(:name).includes(:products)
      .page(params[:page]).per(Settings.per_page)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t "flash.success.create_category_success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "flash.danger.create_category_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.success.update_category_success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "flash.danger.update_category_fail"
      render :edit
    end
  end

  def destroy
    if @category.products.any?
      flash[:danger]= t "category.cant_delete_category"
    else
      if @category.destroy
        flash[:success] = t "flash.success.delete_category_success"
      else
        flash[:danger] = t "flash.danger.delete_category_fail"
      end
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:warning] = t "view.admin.categories.not_found"
    redirect_to admin_categories_path
  end
end
