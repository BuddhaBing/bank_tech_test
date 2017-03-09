require 'date'

class Account

  attr_reader :balance, :account_history

  def initialize
    @balance = 0
    @account_history = []
  end

  def deposit(date=Date.today, amount)
    @balance += amount
    @account_history << { date => amount }
  end

  def withdraw(date=Date.today, amount)
    @balance -= amount
    @account_history << { date => -amount }
  end

end
