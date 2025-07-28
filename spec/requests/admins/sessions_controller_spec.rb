require 'rails_helper'

RSpec.describe "Admins::Sessions", type: :request do
  let(:school) { create(:school) }
  let(:admin) { create(:admin, school: school) }

  describe "GET /schools/:school_id/admins/login (new)" do
    it "renders the login form successfully" do
      get school_admins_login_path(school)

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "POST /schools/:school_id/admins/login (create)" do
    context "with valid credentials" do
      it "logs in the admin and redirects to admin's show page" do
        post school_admins_login_path(school), params: { email: admin.email, password: admin.password }

        expect(session[:admin_id]).to eq(admin.id)
        expect(response).to redirect_to(school_admins_dashboard_path(school))
      end
    end

    context "with invalid password" do
      it "does not log in and re-renders the login form with an alert" do
        post school_admins_login_path(school), params: { email: admin.email, password: "wrongpass" }

        expect(session[:admin_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end

    context "with non-existent admin email" do
      it "raises ActiveRecord::RecordNotFound" do
        post school_admins_login_path(school), params: { email: "nope@example.com", password: "anything" }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("The page you were looking for doesn't exist")
      end
    end

    context "with non-existent school" do
      it "raises ActiveRecord::RecordNotFound" do
        post school_admins_login_path(99999), params: { email: admin.email, password: admin.password }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("The page you were looking for doesn't exist")
      end
    end
  end

  describe "DELETE /logout (destroy)" do
    before do
      # Simulate logged in admin by setting session
      post school_admins_login_path(school), params: { email: admin.email, password: admin.password }

      expect(session[:admin_id]).to eq(admin.id)
    end

    it "logs out the admin and redirects to root" do
      delete school_admins_logout_path

      expect(session[:admin_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
