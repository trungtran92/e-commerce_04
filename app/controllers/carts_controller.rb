class CartsController < ApplicationController
  def index
    @cart = session[:cart] ? session[:cart] : Hash.new
    @quantity_product = @cart.map {|id, quantity| [Product.find_by(id: id), quantity]}
  end

  def new
    session[:cart] = nil
    redirect_to cart_path
  end

  def create
    id = params[:product_id]
    session[:cart] = {} unless session[:cart]
    cart = session[:cart]
    # debugger
    cart[id] = cart[id] ? (cart[id].to_i + 1) : 1
    redirect_to products_path
  end

  def update
    session[:cart][params[:id]] = params[:quantity]
    redirect_to carts_path
  end

  def destroy
    session[:cart][params[:id]] = nil
    session[:cart].delete_if {|key, value| value.blank?}
    redirect_to carts_path
  end
end
