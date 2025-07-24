require 'rails_helper'

RSpec.describe "terms/new", type: :view do
  before(:each) do
    assign(:term, Term.new())
  end

  it "renders new term form" do
    render

    assert_select "form[action=?][method=?]", terms_path, "post" do
    end
  end
end
