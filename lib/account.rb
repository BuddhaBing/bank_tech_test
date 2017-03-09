require 'date'
require_relative 'terminal_print'

class Account

  attr_reader :balance, :account_history

  def initialize(balance=0.0, printer=TerminalPrint)
    @printer = printer
    @balance = balance
    @account_history = []
  end

  def deposit(date=Date.today, amount)
    log_transaction(date, amount)
    @balance += amount
  end

  def withdraw(date=Date.today, amount)
    raise "Insufficient balance" if @balance - amount < 0
    log_transaction(date, -amount)
    @balance -= amount
  end

  def statement
    @printer.statement(@account_history)
  end

  private

  def log_transaction(date, amount)
    @account_history << { date => amount }
  end

end
