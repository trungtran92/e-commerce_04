require "rails_helper"

RSpec.describe Product, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:description).of_type(:text)}
      it {should have_db_column(:price).of_type(:float)}
      it {should have_db_column(:quantity).of_type(:integer)}
      it {should have_db_column(:category_id).of_type(:integer)}
    end
  end

  context "validates" do
    it {is_expected.to validate_presence_of :category_id}
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :price}
  end

  context "associations" do
    it {is_expected.to belong_to :category}
    it {is_expected.to have_many :order_details}
  end
end
