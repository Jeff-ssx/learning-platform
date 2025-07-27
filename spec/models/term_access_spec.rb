require 'rails_helper'

RSpec.describe TermAccess, type: :model do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }

  subject { build(:term_access, student: student, term: term, payment_method: :credit_card) }

  describe 'association' do
    it { should belong_to(:student) }
    it { should belong_to(:term) }
  end

  describe 'validations' do
    it { should validate_presence_of(:payment_method) }
    it { should validate_presence_of(:student) }
    it { should validate_presence_of(:term) }

    it 'validates uniqueness of student scoped to term' do
      create(:term_access, student: student, term: term)
      should validate_uniqueness_of(:student_id).scoped_to(:term_id)
    end
  end

  describe 'student_and_term_belong_to_same_school' do
    context 'when student and term belong to the same school' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when student and term belong to different schools' do
      let(:other_school) { create(:school) }
      let(:term) { create(:term, school: other_school) }

      it 'is not valid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:base]).to include("Student and Term must belong to the same school")
      end
    end
  end
end
