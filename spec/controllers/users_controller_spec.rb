require "rails_helper"

RSpec.describe UsersController, type: :controller do
  login_user

  describe "GET #users/:id" do
    context "load user success" do
      it "responds successfully with show bookmarked jobs" do
        get :show, params:{id: controller.current_user.id}
        expect(response).to have_http_status(200)
      end

      it "user found" do
        get :show, params:{id: controller.current_user}
        expect(response).to render_template :show
      end

      it "load user not found" do
        get :show, params:{id: 9999}
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe "PUT #users/:id" do
    it "update user" do
      put :update, params: {id: controller.current_user.id, user: {name: "testing", email: "test_default@gmail.com" }}
      response.should be_successful
    end

    it "update fail" do
      put :update, params: {id: controller.current_user.id, user: {email: ""}}
      expect(response).to render_template :edit
    end
  end
end
