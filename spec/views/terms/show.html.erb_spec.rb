require 'rails_helper'

RSpec.describe "terms/show", type: :view do
  before(:each) do
    assign(:term, Term.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
