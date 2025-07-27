require 'rails_helper'

RSpec.describe TermAccessBuilder, type: :service do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }

  describe "#call" do
    context "with valid attributes" do
      let(:service) { described_class.new(student: student, term: term, payment_method: :credit_card) }

      it "creates a new TermAccess successfully" do
        expect { service.call }.to change(TermAccess, :count).by(1)
        expect(service.term_access).to be_persisted
        expect(service.term_access.payment_method).to eq("credit_card")
        expect(service.term_access.student).to eq(student)
        expect(service.term_access.term).to eq(term)
      end
    end

    context "with invalid attributes" do
      let(:other_school) { create(:school) }
      let(:term_in_other_school) { create(:term, school: other_school) }
      let(:service) { described_class.new(student: student, term: term_in_other_school, payment_method: :credit_card) }

      it "does not create a TermAccess when validation fails" do
        expect(service.call).to be false
        expect(service.term_access).not_to be_persisted
        expect(service.term_access.errors[:base]).to include("Student and Term must belong to the same school")
      end
    end
  end
end