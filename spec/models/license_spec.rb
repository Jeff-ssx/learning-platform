require 'rails_helper'

RSpec.describe License, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:term) }
    it { is_expected.to belong_to(:student).optional }
  end

  describe 'validations' do
    subject { build(:license, term: create(:term)) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
    it { is_expected.to validate_presence_of(:term) }
  end

  describe '#activate!' do
    let(:school) { create(:school) }
    let(:term) { create(:term, school: school) }
    let(:student) { create(:student, school: school) }

    context 'when unused and school matches' do
      let(:license) { create(:license, term: term, status: :unused) }

      it 'activates the license' do
        expect { license.activate!(student) }.to change { license.reload.status }.from('unused').to('used')
        expect(license.student).to eq(student)
      end
    end

    context 'when already used' do
      let(:license) { create(:license, term: term, status: :used) }

      it 'does not activate the license' do
        expect(license.activate!(student)).to be false
        expect(license.reload.student).to be_nil
      end
    end

    context 'when student school mismatches' do
      let(:license) { create(:license, term: term) }
      let(:other_school_student) { create(:student) }

      it 'does not activate the license' do
        expect(license.activate!(other_school_student)).to be false
      end
    end
  end

  describe '#validate_update' do
    let(:license) { create(:license, term: create(:term), status: :unused) }

    context 'when updating with used status' do
      it 'adds an error when status is used' do
        license.status = 'used'
        license.student = nil
        license.valid?
        expect(license.errors[:student]).to include('must have a student when used.')
      end
    end

    context 'when already used' do
      let(:used_license) { create(:license, term: create(:term), status: :used, student: create(:student)) }

      it 'does not allow updating a used license' do
        used_license.status = 'unused'
        used_license.valid?
        expect(used_license.errors[:status]).to include('cannot be modified once used.')
      end
    end
  end
end
