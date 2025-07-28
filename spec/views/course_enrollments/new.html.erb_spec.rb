require 'rails_helper'

RSpec.describe "course_enrollments/new", type: :view do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }
  let(:course) { create(:course, term: term) }

  before(:each) do
    assign(:school, school)
    assign(:student, student)
    assign(:term, term)
    assign(:course, course)
    assign(:course_enrollment, CourseEnrollment.new)
  end

  it "renders new course_enrollments form" do
    render

    assert_select "form[action=?][method=?]", school_student_term_course_course_enrollments_path(school, student, term, course), "post"
    
    assert_select "a[href=?]", school_student_term_path(school, student, term), text: "Back to courses"
  end
end
