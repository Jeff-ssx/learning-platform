require "rails_helper"

RSpec.describe Students::SessionsController, type: :routing do
  let(:school_id) { 1 }

  describe "routing" do
    it "routes to GET /schools/:school_id/students/login" do
      expect(get: "/schools/#{school_id}/students/login").to route_to(
        controller: "students/sessions",
        action: 'new',
        school_id: school_id.to_s
        )
    end

    it "routes to POST /schools/:school_id/students/login" do
      expect(post: "/schools/#{school_id}/students/login").to route_to(
        controller: "students/sessions",
        action: 'create',
        school_id: school_id.to_s
        )
    end

    it "routes to DELETE /schools/:school_id/students/logout" do
      expect(delete: "/schools/#{school_id}/students/logout").to route_to(
        controller: "students/sessions",
        action: 'destroy',
        school_id: school_id.to_s
        )
    end
  end
end
