require 'rails_helper'

RSpec.describe TermAccessBuilder, type: :service do
  let(:school) { create(:school) }
  let(:student) { create(:student, school: school) }
  let(:term) { create(:term, school: school) }
  let(:context) { {} }

  describe "#call" do
    context "when the processor succeeds" do
      before do
        processor_double = instance_double(Payment::CreditCardPaymentProcessor, process!: true)
        allow(Payment::PaymentFactory).to receive(:build)
          .with(type: :credit_card, term: term, student: student, context: context)
          .and_return(processor_double)
      end

      let(:builder) { described_class.new(student: student, term: term, payment_method: :credit_card, context: context) }

      it 'should return true' do
        expect(builder.call).to eq(true)
      end

      it "creates a persisted TermAccess with correct associations" do
        expect { builder.call }.to change(TermAccess, :count).by(1)

        access = builder.term_access
        expect(access).to be_persisted
        expect(access.payment_method).to eq("credit_card")
        expect(access.student).to eq(student)
        expect(access.term).to eq(term)
      end
    end

    context "when the processor fails" do
      before do
        processor_double = instance_double(Payment::CreditCardPaymentProcessor, process!: false)
        allow(Payment::PaymentFactory).to receive(:build).and_return(processor_double)
      end

      let(:builder) { described_class.new(student: student, term: term, payment_method: :credit_card, context: context) }

      it "does not create TermAccess and returns false" do
        expect { builder.call }.not_to change(TermAccess, :count)
        expect(builder.term_access).to be_nil
      end
    end

    context "when the TermAccess fails to save" do
      before do
        processor_double = instance_double(Payment::CreditCardPaymentProcessor, process!: true)
        allow(Payment::PaymentFactory).to receive(:build).and_return(processor_double)

        # Simulate validation failure by making student and term from different schools
        student.update!(school: create(:school))
      end

      let(:builder) { described_class.new(student: student, term: term, payment_method: :credit_card, context: context) }

      it "does not persist TermAccess and returns false" do
        expect(builder.call).to eq(false)
        expect(builder.term_access).not_to be_persisted
        expect(builder.term_access.errors[:base]).to include("Student and Term must belong to the same school")
      end
    end
  end
end
