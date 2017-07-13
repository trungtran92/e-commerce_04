require "rails_helper"

RSpec.describe "users/show.html.erb", type: :view do
  login_user

  it "should index user" do
    assign :user, view.current_user
    render
    expect(rendered).to include view.current_user.name
    expect(rendered).to include view.current_user.email
  end
end
