require 'rails_helper'

RSpec.describe "terms/edit", type: :view do
  let(:term) {
    Term.create!()
  }

  before(:each) do
    assign(:term, term)
  end

  it "renders the edit term form" do
    render

    assert_select "form[action=?][method=?]", term_path(term), "post" do
    end
  end
end
