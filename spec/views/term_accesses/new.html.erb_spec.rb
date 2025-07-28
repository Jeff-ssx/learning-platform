require 'rails_helper'

RSpec.describe "term_accesses/new", type: :view do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }

  before(:each) do
    assign(:school, school)
    assign(:student, student)
    assign(:term, term)
    assign(:term_access, TermAccess.new)
  end

  it "renders new term_access form for license payment" do
    render

    assert_select "form[action=?][method=?]", school_student_term_term_accesses_path(school, student, term), "post" do
      assert_select "input[name=?][type=?][value=?]", "term_access[payment_method]", "hidden", "license"
      assert_select "input[name=?]", "term_access[license_code]"
      assert_select "input[type=?][value=?]", "submit", "Pay with License"
    end
  end

  it "renders new term_access form for credit card payment" do
    render

    assert_select "form[action=?][method=?]", school_student_term_term_accesses_path(school, student, term), "post" do
      assert_select "input[name=?][type=?][value=?]", "term_access[payment_method]", "hidden", "credit_card"
      assert_select "input[name=?]", "term_access[credit_card_num]"
      assert_select "input[type=?][value=?]", "submit", "Pay with Credit Card"
    end
  end
end
