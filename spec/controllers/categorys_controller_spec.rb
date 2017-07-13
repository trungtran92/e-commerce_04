require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show" do
    category = FactoryGirl.create :category

    it "should be param" do
      get :show, params:{id: category.id}
      expect(category).to be
    end

    it  "load category not found" do
      get :show, params:{id: 0}
      expect(flash[:danger]).to be_present
    end
  end
end
