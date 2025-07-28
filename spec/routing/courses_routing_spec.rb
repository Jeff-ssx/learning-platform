require "rails_helper"

RSpec.describe CoursesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/schools/1/students/2/terms/3/courses/4").to route_to(
        controller: 'courses',
        action: 'show',
        school_id: '1',
        student_id: '2',
        term_id: '3',
        id: '4'
      )
    end
  end
end
