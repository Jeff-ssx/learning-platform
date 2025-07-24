require 'rails_helper'

RSpec.describe "terms/index", type: :view do
  before(:each) do
    assign(:terms, [
      Term.create!(),
      Term.create!()
    ])
  end

  it "renders a list of terms" do
    render
    cell_selector = 'div>p'
  end
end
