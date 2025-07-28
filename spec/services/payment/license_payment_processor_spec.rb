require 'rails_helper'

RSpec.describe Payment::LicensePaymentProcessor, type: :model do
  it_behaves_like "a payment processor"

  let(:term) { create(:term) }
  let(:student) { create(:student) }
  let(:license_code) { 'ABC123' }
  let(:license) { create(:license, code: license_code, term: term) }
  let(:context) { { license_code: license_code } }

  subject(:processor) { described_class.new(term: term, student: student, context: context) }

  describe '#initialize' do
    it 'sets license_code and finds the license' do
      license
      expect(processor.license_code).to eq(license_code)
      expect(processor.license).to eq(license)
    end
  end

  describe '#process!' do
    context 'when license is nil' do
      before { allow(processor).to receive(:license).and_return(nil) }

      it 'returns false' do
        expect(processor.process!).to eq(false)
      end
    end

    context 'when license term mismatches' do
      let(:wrong_term) { create(:term) }
      let(:license) { create(:license, code: license_code, term: wrong_term) }

      it 'returns false' do
        expect(processor.process!).to eq(false)
      end
    end

    context 'when license is valid' do
      let(:license) { instance_double(License) }

      before do
        allow(License).to receive(:find_by).with(code: license_code).and_return(license)
        allow(license).to receive(:term).and_return(term)
        allow(license).to receive(:activate!).with(student).and_return(true)
      end

      it 'calls activate! and returns true' do
        expect(processor.process!).to eq(true)
      end
    end
  end

  describe '#find_license' do
    it 'finds the license by code' do
      expect(License).to receive(:find_by).with(code: license_code).and_return(license)
      described_class.new(term: term, student: student, context: context)
    end
  end
end
