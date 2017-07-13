require "rails_helper"

RSpec.describe "products/show.html.erb", type: :view do

  let(:product) {FactoryGirl.create :product}
  it "should index user" do
    assign :product, product
    render
    expect(rendered).to include product.name
    expect(rendered).to include product.description
    expect(rendered).to include product.price.to_s
    expect(rendered).to include product.quantity.to_s
  end
end
