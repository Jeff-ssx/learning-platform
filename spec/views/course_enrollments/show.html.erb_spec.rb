require 'rails_helper'

RSpec.describe "course_enrollments/show", type: :view do
  before(:each) do
    assign(:course_enrollment, CourseEnrollment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
