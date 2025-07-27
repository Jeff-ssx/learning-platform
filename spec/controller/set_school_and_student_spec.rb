require 'rails_helper'

RSpec.describe SetSchoolAndStudent, type: :controller do
  controller(ApplicationController) do
    include SetSchoolAndStudent

    def test_action
      set_school
      set_student
      render json: { school_id: @school.id, student_id: @student.id }
    end
  end

  let!(:school) { create(:school) }
  let!(:student) { create(:student, school: school) }

  before do
    routes.draw { get "test_action" => "anonymous#test_action" }
  end

  it "sets the school and student correctly" do
    get :test_action, params: { school_id: school.id, student_id: student.id }

    expect(assigns(:school)).to eq(school)
    expect(assigns(:student)).to eq(student)

    json = JSON.parse(response.body)
    expect(json["school_id"]).to eq(school.id)
    expect(json["student_id"]).to eq(student.id)
  end
end
