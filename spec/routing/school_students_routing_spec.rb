require "rails_helper"

RSpec.describe StudentsController, type: :routing do
  let(:school_id) { 1 }
  let(:id) { 1 }

  describe "routing" do
    it "routes to GET /schools/:school_id/students/:id" do
      expect(get: "/schools/#{school_id}/students/#{id}").to route_to(
        controller: "students",
        action: 'show',
        school_id: school_id.to_s,
        id: id.to_s
      )
    end
  end
end
