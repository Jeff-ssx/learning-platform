require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do 
    it { should belong_to(:school)}
  end

  describe 'validations' do
    subject { FactoryBot.build(:student) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'should validate password length on create' do 
      
    end
  end
end
