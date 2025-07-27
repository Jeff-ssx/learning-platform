require 'rails_helper'

RSpec.describe "terms/show", type: :view do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }
  
  before(:each) do
    assign(:school, school)
    assign(:student, student)
    assign(:term, term)
  end

  it "renders terms info" do
    render

    expect(rendered).to include(school.name)
    expect(rendered).to include(term.name)
  end

  it "renders a link to terms" do
    render

    assert_select "a[href=?]", school_student_path(school, student), text: "Back to terms"
  end

  context 'when student does not have access' do 
    it 'should render a button to grant access' do 
      allow(student).to receive(:terms).and_return([])

      render

      expect(rendered).to have_selector("form[action='#{new_school_student_term_term_access_path(school, student, term)}'][method='get']") do |form|
        expect(form).to have_button("Grant Access")
      end
    end
  end

  context 'when student does have access' do 
    it 'should not render a button to grant access' do 
      allow(student).to receive(:terms).and_return([term])
      
      render

      expect(rendered).not_to have_selector("form[action='#{new_school_student_term_term_access_path(school, student, term)}'][method='get']")
    end
  end

end
