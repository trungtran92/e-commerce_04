class Admin::StatisticsController < ApplicationController
  before_action :require_login, :verify_admin

  def index
    @orders = OrderDetail.select :product_name
  end
end
