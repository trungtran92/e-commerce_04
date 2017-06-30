class OrdersController < ApplicationController
  before_action :require_login, :session_cart

  def new
    @order = current_user.orders.new
    @quantity_product = @session_cart.map {|id, quantity|
      [Product.find_by(id: id), quantity]}
    each_amout = []
    if @quantity_product
      @quantity_product.each do |product, quantity|
        each_amout << product.price.to_i * quantity.to_i
      end
    end
    @total_amout = each_amout.
      reduce(0) {|total_amout, price| total_amout += price}
  end

  def create
    @order = current_user.orders.new order_params

    if @order.save
      @session_cart.keys.each do |item|
        @quantity = @session_cart[item].to_i
        @order_detail = @order.order_details.new
        @product_in_order = Product.find_by id: item.to_i
        @order_detail.update quantity: @quantity,
          product_id: item.to_i, product_name: @product_in_order.name,
          product_price: @product_in_order.price
        @order_detail.save
      end

      @session_cart.clear
      @user = User.find_by id: logged_in?.id

      if @user
          SendEmailJob.set(wait: Settings.time_wailt_email.seconds)
            .perform_later @user
          flash[:success] = t "flash.success.order_success"
      end
    else
      flash[:danger] = t "flash.danger.orders_create_failed"
    end
    redirect_to root_url
  end

  private

  def order_params
    params.require(:order).permit :address_recive, :phone_recive
  end

  def session_cart
    @session_cart = session[:cart]
    redirect_to root_url if @session_cart.blank?
  end
end
