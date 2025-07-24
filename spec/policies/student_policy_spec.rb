require 'rails_helper'

RSpec.describe StudentPolicy, type: :policy do
  let(:school) { create(:school) }
  let(:other_school) { create(:school) }

  let(:student) { create(:student, school: school) }
  let(:same_school_student) { create(:student, school: school) }
  let(:different_school_student) { create(:student, school: other_school) }

  subject { described_class }

  # permissions ".scope" do
  #   pending "add some examples to (or delete) #{__FILE__}"
  # end

  describe '#show?' do
    subject { described_class.new(user, student).show? }

    context 'when user is the same student' do
      let(:user) { student }

      it { is_expected.to be true }
    end

    context 'when user is a different student' do
      let(:user) { same_school_student }

      it { is_expected.to be false }
    end
  end

  describe '#login?' do
    subject { described_class.new(user, student).login? }

    context 'when user is from the same school' do
      let(:user) { same_school_student }

      it { is_expected.to be true }
    end

    context 'when user is from a different school' do
      let(:user) { different_school_student }

      it { is_expected.to be false }
    end
  end
end
