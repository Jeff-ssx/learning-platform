require 'rails_helper'

RSpec.describe Term, type: :model do
  let(:school) { create(:school) }
  let(:name) { 'Term Name' }

  subject { build(:term, school: school, name: name) }

  describe 'association' do
    it { should belong_to(:school) }
    it { should have_many(:term_accesses).dependent(:destroy) }
    it { should have_many(:students).through(:term_accesses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:school) }
    it { should validate_presence_of(:name) }

    it 'validates uniqueness of name scoped to school' do
      create(:term, school: school, name: name)
      should validate_uniqueness_of(:name).scoped_to(:school_id)
    end
  end
end
