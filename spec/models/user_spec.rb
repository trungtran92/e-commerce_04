require "rails_helper"

RSpec.describe User, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:email).of_type(:string)}
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:address).of_type(:string)}
    end
  end

  describe "validating" do
    subject{FactoryGirl.create :user}
    context "associations" do
      it{is_expected.to have_many :orders}
      it{is_expected.to have_many :suggests}
    end

    context "validations" do
      it {should validate_presence_of(:email)}
    end
  end
end
