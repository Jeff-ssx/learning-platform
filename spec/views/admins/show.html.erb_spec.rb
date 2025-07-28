require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  let(:school) { build_stubbed(:school, name: "Test School") }

  before do
    assign(:school, school)

    assign(:students_per_course, {
      [1, "Math"] => 2,
      [2, "Science"] => 1
    })

    assign(:students_per_term, {
      [1, "Fall"] => 2,
      [2, "Winter"] => 1
    })

    assign(:credit_card_enrollments, 1)
    assign(:license_enrollments, 2)
  end

  it "displays school name and enrollment stats" do
    render

    expect(rendered).to include("Test School Dashboard")
    expect(rendered).to include("Math: 2 students")
    expect(rendered).to include("Science: 1 students")
    expect(rendered).to include("Fall: 2 students")
    expect(rendered).to include("Winter: 1 students")
    expect(rendered).to include("Credit Card: 1")
    expect(rendered).to include("License: 2")
  end
end
