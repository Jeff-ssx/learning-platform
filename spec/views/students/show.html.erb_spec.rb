require 'rails_helper'

RSpec.describe "students/show", type: :view do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }

  before(:each) do
    assign(:student, student)
    assign(:school, school)
    assign(:accessible_terms, [term])
    assign(:inaccessible_terms, [])
  end

  it "displays student name and email" do
    render

    expect(rendered).to include(student.name)
    expect(rendered).to include(student.email)
  end

  it "shows accessible terms section with term name" do
    create(:term_access, student: student, term: term)

    render

    expect(rendered).to include("Accessible Terms")
    expect(rendered).to include(term.name)
  end

  it "shows available terms section with no terms message" do
    render

    expect(rendered).to include("Available Terms")
    expect(rendered).to include("No terms available")
  end
end
