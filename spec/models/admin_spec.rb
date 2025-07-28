require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'associations' do 
    it { should belong_to(:school)}
  end

  describe 'validations' do
    subject { build(:admin) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'should validate password length on create' do 
      admin = build(:admin, password: '123', password_confirmation: '123')
      expect(admin).not_to be_valid
      expect(admin.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
