require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(),
      Course.create!()
    ])
  end

  it "renders a list of courses" do
    render
    cell_selector = 'div>p'
  end
end
