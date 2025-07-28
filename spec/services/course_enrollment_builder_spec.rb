require 'rails_helper'

RSpec.describe CourseEnrollmentBuilder, type: :service do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }
  let(:course) { create(:course, term: term) }

  describe "#call" do
    context "with valid attributes" do
      let(:service) { described_class.new(student: student, course: course) }

      it "creates a new CourseEnrollment successfully" do
        expect { service.call }.to change(CourseEnrollment, :count).by(1)
        expect(service.course_enrollment).to be_persisted
        expect(service.course_enrollment.student).to eq(student)
        expect(service.course_enrollment.course).to eq(course)
      end
    end

    context "with invalid attributes" do
      let(:other_school) { create(:school) }
      let(:term_in_other_school) { create(:term, school: other_school) }
      let(:course_in_other_school) { create(:course, term: term_in_other_school)}
      let(:service) { described_class.new(student: student, course: course_in_other_school) }

      it "does not create a CourseEnrollment when validation fails" do
        expect(service.call).to be false
        expect(service.course_enrollment).not_to be_persisted
        expect(service.course_enrollment.errors[:base]).to include("Student and Course must belong to the same school")
      end
    end
  end
end