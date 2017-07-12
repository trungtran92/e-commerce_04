require "rails_helper"

RSpec.describe Category, type: :model do
  context "associations" do
    it {is_expected.to have_many :products}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end

  context "columns" do
    it {should have_db_column(:name).of_type(:string)}
  end
end
