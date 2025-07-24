require 'rails_helper'

RSpec.describe "schools/index", type: :view do

  let(:schools) {
    [
      create(:school, name: "School1"),
      create(:school, name: "School2"),
    ]
  }

  it "renders a list of schools with login links" do
    assign(:schools, schools)

    render

    expect(rendered).to include("School1")
    expect(rendered).to include("School2")

    schools.each do |school|
      expect(rendered).to have_link(
        "Login with this school",
        href: school_students_login_path(school)
      )
    end
  end
end
