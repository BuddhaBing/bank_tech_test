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
    it 'deducts from the balance when a withdrawal is made' do
      expect{subject.withdraw(50)}.to change{subject.balance}.by(-50)
    end
  end
  context '#history' do
    it 'stores deposit amounts and the dates they were made on' do
      subject.deposit(100)
      expect(subject.history.keys).to contain(Date.today)
    end
  end
end
