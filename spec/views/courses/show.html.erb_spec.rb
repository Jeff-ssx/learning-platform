require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @school = create(:school)
    @student = create(:student, school: @school)
    @term = create(:term, school: @school)
    assign(:school, @school)
    assign(:student, @student)
    assign(:term, @term)
    assign(:course, create(:course, term: @term))
  end

  it "renders attributes in <p>" do
    render
  end
end
