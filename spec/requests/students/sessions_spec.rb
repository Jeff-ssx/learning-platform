require 'rails_helper'

RSpec.describe "Students::Sessions", type: :request do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school, email: "student@example.com", password: "securepass", password_confirmation: "securepass") }

  describe "GET /schools/:school_id/students/login (new)" do
    it "renders the login form successfully" do
      get school_students_login_path(school)

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "POST /schools/:school_id/students/login (create)" do
    context "with valid credentials" do
      it "logs in the student and redirects to student's show page" do
        post school_students_login_path(school), params: { email: student.email, password: "securepass" }

        expect(session[:student_id]).to eq(student.id)
        expect(response).to redirect_to(school_student_path(school, student))
      end
    end

    context "with invalid password" do
      it "does not log in and re-renders the login form with an alert" do
        post school_students_login_path(school), params: { email: student.email, password: "wrongpass" }

        expect(session[:student_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end

    context "with non-existent student email" do
      it "raises ActiveRecord::RecordNotFound" do
        post school_students_login_path(school), params: { email: "nope@example.com", password: "anything" }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("The page you were looking for doesn't exist")
      end
    end

    context "with non-existent school" do
      it "raises ActiveRecord::RecordNotFound" do
        post school_students_login_path(99999), params: { email: student.email, password: "securepass" }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("The page you were looking for doesn't exist")
      end
    end
  end

  describe "DELETE /logout (destroy)" do
    before do
      # Simulate logged in student by setting session
      post school_students_login_path(school), params: { email: student.email, password: "securepass" }

      expect(session[:student_id]).to eq(student.id)
    end

    it "logs out the student and redirects to root" do
      delete school_students_logout_path

      expect(session[:student_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
