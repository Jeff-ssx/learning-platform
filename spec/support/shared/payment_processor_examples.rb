RSpec.shared_examples "a payment processor" do
  it 'responds to #process!' do
    expect(subject).to respond_to(:process!)
  end
end
