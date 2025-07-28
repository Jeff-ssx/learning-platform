require "rails_helper"

RSpec.describe Admins::SessionsController, type: :routing do
  let(:school_id) { 1 }

  describe "routing" do
    it "routes to GET /schools/:school_id/admins/login" do
      expect(get: "/schools/#{school_id}/admins/login").to route_to(
        controller: "admins/sessions",
        action: 'new',
        school_id: school_id.to_s
        )
    end

    it "routes to POST /schools/:school_id/admins/login" do
      expect(post: "/schools/#{school_id}/admins/login").to route_to(
        controller: "admins/sessions",
        action: 'create',
        school_id: school_id.to_s
        )
    end

    it "routes to DELETE /schools/:school_id/admins/logout" do
      expect(delete: "/schools/#{school_id}/admins/logout").to route_to(
        controller: "admins/sessions",
        action: 'destroy',
        school_id: school_id.to_s
        )
    end
  end
end
