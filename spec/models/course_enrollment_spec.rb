require 'rails_helper'

RSpec.describe CourseEnrollment, type: :model do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }
  let(:course) { create(:course, term: term) }
  let(:term_access) { create(:term_access, student: student, term: term, payment_method: :credit_card) }
  subject { build(:course_enrollment, student: student, course: course) }

  describe 'association' do
    it { should belong_to(:student) }
    it { should belong_to(:course) }
  end

  describe 'validations' do
    it { should validate_presence_of(:student) }
    it { should validate_presence_of(:course) }

    it 'validates uniqueness of student scoped to term' do
      create(:course_enrollment, student: student, course: course)
      should validate_uniqueness_of(:course_id).scoped_to(:student_id)
    end
  end

  describe 'student_and_course_belong_to_same_school' do
    context 'when student and course belong to the same school' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when student and course belong to different schools' do
      let(:other_school) { create(:school) }
      let(:term) { create(:term, school: other_school) }
      let(:course) { create(:course, term: term) }

      it 'is not valid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:base]).to include("Student and Course must belong to the same school")
      end
    end
  end
end
