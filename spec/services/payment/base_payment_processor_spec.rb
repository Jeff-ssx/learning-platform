require 'rails_helper'

RSpec.describe Payment::BasePaymentProcessor, type: :model do
  it_behaves_like "a payment processor"


  let(:term) { double("Term") }
  let(:student) { double("Student") }
  let(:context) { double("Context") }

  subject(:processor) { described_class.new(term: term, student: student, context: context) }

  describe '#initialize' do
    it 'sets term, student, and context' do
      expect(processor.term).to eq(term)
      expect(processor.student).to eq(student)
    end
  end

  describe '#process!' do
    it 'raises NoMethodError as it is abstract' do
      expect { processor.process! }.to raise_error(NoMethodError)
    end
  end
end
