module ControllerHelpers
  include Warden::Test::Helpers

  def sign_in (user = double("user"), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env["warden"]).to receive(:authenticate!)
        .and_throw(:warden, scope: :user)
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env["warden"]).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end

  def sign_out resource_or_scope
    scope = Devise::Mapping.find_scope! resource_or_scope
    logout scope
  end
end
