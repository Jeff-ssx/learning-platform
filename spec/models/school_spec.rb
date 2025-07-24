require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'associations' do 
    it { should have_many(:students)}
  end

  describe 'validations' do
    subject { FactoryBot.build(:school) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
