require 'rails_helper'

RSpec.describe "course_enrollments/edit", type: :view do
  let(:course_enrollment) {
    CourseEnrollment.create!()
  }

  before(:each) do
    assign(:course_enrollment, course_enrollment)
  end

  it "renders the edit course_enrollment form" do
    render

    assert_select "form[action=?][method=?]", course_enrollment_path(course_enrollment), "post" do
    end
  end
end
