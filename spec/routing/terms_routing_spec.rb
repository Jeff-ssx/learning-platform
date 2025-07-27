require "rails_helper"

RSpec.describe TermsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/schools/1/students/2/terms/3").to route_to(
        controller: 'terms',
        action: 'show',
        school_id: '1',
        student_id: '2',
        id: '3'
      )
    end

  end
end
