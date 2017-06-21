class StaticPagesController < ApplicationController
  def home
    @hot_trend_products = Product.trend_product
      .select :id, :name, :description, :price, :category_id, :image, :quantity

    @list_products = Product.select(:id, :name, :description, :price,
      :category_id, :image, :quantity).order(:name)
      .page(params[:page]).per Settings.per_page
  end

  def show
    if valid_page?
      render template: "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist? Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb")
  end
end
