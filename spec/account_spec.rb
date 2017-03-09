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
    it 'adds to the balance when multiple deposits are made' do
      5.times do
        subject.deposit(100)
      end
      expect(subject.balance).to be(500)
    end
    it 'deducts from the balance when a withdrawal is made' do
      expect{subject.withdraw(50)}.to change{subject.balance}.by(-50)
    end
    it 'deducts from the balance when multiple withdrawals are made' do
      subject.deposit(500)
      5.times do
        subject.withdraw(50)
      end
      expect(subject.balance).to be(250)
    end
  end
  context '#history' do
    context 'deposits' do
      it 'stores deposit amounts' do
        subject.deposit(100)
        expect(subject.history.first.has_value?(100)).to be true
      end
      it 'stores the dates a deposit was made on' do
        subject.deposit(100)
        expect(subject.history.first.has_key?(Date.today)).to be true
      end
      it 'stores multiple deposits' do
        subject.deposit(100)
        subject.deposit(500)
        expect(subject.history[0].has_value?(100) && subject.history[1].has_value?(500)).to be true
      end
    end
    context 'withdrawals' do
      it 'stores withdrawal amounts' do
        subject.withdraw(100)
        expect(subject.history.first.has_value?(-100)).to be true
      end
      it 'stores the dates a withdrawal was made on' do
        subject.withdraw(100)
        expect(subject.history.first.has_key?(Date.today)).to be true
      end
      it 'stores multiple withdrawals' do
        subject.deposit(1000)
        subject.withdraw(100)
        subject.withdraw(500)
        expect(subject.history[1].has_value?(-100) && subject.history[2].has_value?(-500)).to be true
      end
    end
  end
end
