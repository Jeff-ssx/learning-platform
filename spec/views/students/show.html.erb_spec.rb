require 'rails_helper'

RSpec.describe "students/show", type: :view do
  let(:school) { FactoryBot.create(:school) }
  let(:student) { FactoryBot.create(:student, school: school) }

  before(:each) do
    assign(:student, student)
    assign(:school, school)
  end

  it "renders attributes in <p>" do
    render
  end
end
