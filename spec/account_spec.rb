require 'account'

describe Account do
  subject { described_class.new }
  context '#balance' do
    it 'starts with nil balance' do
      expect(subject.balance).to be(0)
    end
  end
end
