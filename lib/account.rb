require 'date'

class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(date=Date.today, amount)
    @balance += amount
    @history << { date => amount }
  end

  def withdraw(date=Date.today, amount)
    @balance -= amount
    @history << { date => -amount }
  end

end
