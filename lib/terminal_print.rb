module TerminalPrint

  def self.statement(history)
    balance = 0
    col_width = 10
    puts "date       ||  credit   ||   debit   ||  balance  "
    history.each do |transaction|
      transaction.each do |date, amount|
        balance += amount
        date = stringify_date(date) unless date.is_a? String
        print_date(col_width, date)
        print_amount(col_width, amount)
        print_balance(col_width, balance)
      end
    end
  end

  private

  def self.print_balance(col_width, balance)
    balance = stringify_amount(balance)
    puts (" " * spaces(col_width, balance)) + balance + " "
  end

  def self.print_date(col_width, date)
    print date + (" " * spaces(col_width,date)) + " ||"
  end

  def self.print_amount(col_width, amount)
    if amount > 0
      amount = stringify_amount(amount)
      print (" " * spaces(col_width,amount)) + amount + " ||"
      print (" " * col_width) + " ||"
    else
      amount = stringify_amount(amount)
      print (" " * col_width) + " ||"
      print (" " * spaces(col_width,amount)) + amount + " ||"
    end
  end

  def self.stringify_amount(amount)
    "%.2f" % (amount.abs / 1.0)
  end

  def self.stringify_date(date)
    date.strftime('%d/%m/%Y')
  end

  def self.spaces(col_width, value)
    col_width - value.to_s.length
  end

end
