require "rails_helper"

RSpec.describe CourseEnrollmentsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/schools/1/students/2/terms/3/courses/4/course_enrollments/new").to route_to(
        controller: 'course_enrollments',
        action: 'new',
        school_id: '1',
        student_id: '2',
        term_id: '3',
        course_id: '4'
      )
    end

    it "routes to #new" do
      expect(post: "/schools/1/students/2/terms/3/courses/4/course_enrollments").to route_to(
        controller: 'course_enrollments',
        action: 'create',
        school_id: '1',
        student_id: '2',
        term_id: '3',
        course_id: '4'
      )
    end
  end
end
