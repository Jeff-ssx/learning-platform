require 'rails_helper'

RSpec.describe "term_accesses/new", type: :view do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }

  before(:each) do
    assign(:school, school)
    assign(:student, student)
    assign(:term, term)
    assign(:term_access, TermAccess.new())
  end

  it "renders new term_access form" do
    render

    assert_select "form[action=?][method=?]", school_student_term_term_accesses_path(school, student, term), "post"
    
    assert_select "a[href=?]", school_student_path(school, student), text: "Back to terms"
  end
end
