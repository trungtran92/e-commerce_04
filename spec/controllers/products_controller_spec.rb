require "rails_helper"

RSpec.describe ProductsController, type: :controller do

  describe "Get #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    product = FactoryGirl.create :product

    it "should be param" do
      get :show, params:{id: product.id}
      expect(product).to be
    end

    it  "load product not found" do
      get :show, params:{id: 0}
      expect(flash[:warning]).to be_present
    end
  end
end
