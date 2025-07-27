require 'rails_helper'

RSpec.describe "course_enrollments/index", type: :view do
  before(:each) do
    assign(:course_enrollments, [
      CourseEnrollment.create!(),
      CourseEnrollment.create!()
    ])
  end

  it "renders a list of course_enrollments" do
    render
    cell_selector = 'div>p'
  end
end
