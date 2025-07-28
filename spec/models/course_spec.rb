require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:school) { create(:school) }
  let(:term) { create(:term, school: school) }
  let(:name) { 'Course Name' }

  subject { build(:course, term: term, name: name) }

  describe 'association' do
    it { should belong_to(:term) }
    it { should have_many(:course_enrollments).dependent(:destroy) }
    it { should have_many(:students).through(:course_enrollments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:term) }
    it { should validate_presence_of(:name) }

    it 'validates uniqueness of name scoped to school' do
      create(:course, term: term, name: name)
      should validate_uniqueness_of(:name).scoped_to(:term_id)
    end
  end
end
