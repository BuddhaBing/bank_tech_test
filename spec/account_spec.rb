require 'account'

describe Account do
  subject { described_class.new }
  context '#balance' do
    it 'starts with nil balance' do
      expect(subject.balance).to be(0)
    end
    it 'adds to the balance when a deposit is made' do
      expect{subject.deposit(100)}.to change{subject.balance}.by(100)
    end
  end
end
