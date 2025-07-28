require 'rails_helper'

RSpec.describe Payment::CreditCardPaymentProcessor, type: :model do
  it_behaves_like "a payment processor"

  let(:term) { create(:term) }
  let(:student) { create(:student) }
  let(:credit_card_num) { 'credit_card_num' }
  let(:context) { { credit_card_num: credit_card_num } }

  subject(:processor) { described_class.new(term: term, student: student, context: context) }

  describe '#initialize' do
    it 'sets credit_card_num' do
      expect(processor.credit_card_num).to eq(credit_card_num)
    end

    context 'when no credit card num provided' do
      it 'sets credit_card_num' do
        @invalid_processor = described_class.new(term: term, student: student, context: {})
        expect(@invalid_processor.credit_card_num).to eq('')
      end
    end
  end

  describe '#process!' do
    it 'return true' do 
        expect(processor.process!).to eq(true)
    end
  end

end
