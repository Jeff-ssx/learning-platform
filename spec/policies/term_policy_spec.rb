require 'rails_helper'

RSpec.describe TermPolicy, type: :policy do
  let(:school) { create(:school) }
  let(:other_school) { create(:school) }

  let(:student) { create(:student, school: school) }
  let(:same_school_student) { create(:student, school: school) }
  let(:different_school_student) { create(:student, school: other_school) }

  let(:term) { create(:term, school: school)}
  let(:different_school_term) { create(:term, school: other_school)}

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
  end
end
