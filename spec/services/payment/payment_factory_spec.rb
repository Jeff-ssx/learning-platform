require 'rails_helper'

RSpec.describe Payment::PaymentFactory, type: :model do
  let(:term) { instance_double('Term') }
  let(:student) { instance_double('Student') }
  let(:context) { { some_key: 'some_value' } }

  describe '.build' do
    context 'when type is license' do
      it 'returns a LicensePaymentProcessor instance with the correct arguments' do
        expect(Payment::LicensePaymentProcessor)
          .to receive(:new)
          .with(term: term, student: student, context: context)
          .and_return(double('LicensePaymentProcessor'))

        described_class.build(
          type: :license,
          term: term,
          student: student,
          context: context
        )
      end
    end

    context 'when type is credit_card' do
      it 'returns a CreditCardPaymentProcessor instance with the correct arguments' do
        expect(Payment::CreditCardPaymentProcessor)
          .to receive(:new)
          .with(term: term, student: student, context: context)
          .and_return(double('CreditCardPaymentProcessor'))

        described_class.build(
          type: :credit_card,
          term: term,
          student: student,
          context: context
        )
      end
    end

    context 'when type is unknown' do
      it 'raises an ArgumentError' do
        expect {
          described_class.build(
            type: :unknown_111,
            term: term,
            student: student,
            context: context
          )
        }.to raise_error(ArgumentError, /Unknown payment type: unknown_111/)
      end
    end
  end
end
