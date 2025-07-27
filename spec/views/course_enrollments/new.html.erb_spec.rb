require 'rails_helper'

RSpec.describe "course_enrollments/new", type: :view do
  before(:each) do
    assign(:course_enrollment, CourseEnrollment.new())
  end

  it "renders new course_enrollment form" do
    render

    assert_select "form[action=?][method=?]", course_enrollments_path, "post" do
    end
  end
end
