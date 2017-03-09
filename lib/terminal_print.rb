module TerminalPrint

  def self.statement(history)
    balance = 0
    col_width = 10
    puts "\n\n\n"
    puts "date       ||  credit   ||   debit   ||  balance  "
    history.each do |transaction|
      transaction.each do |date, amount|
        balance += amount
        date = stringify_date(date)
        print_date(col_width, date)
        print_amount(col_width, amount)
        print_balance(col_width, balance)
      end
    end
  end

  private

  def self.print_balance(col_width, balance)
    puts (" " * spaces(col_width, balance)) + stringify_amount(balance) + " "
  end

  def self.print_date(col_width, date)
    print date + (" " * (spaces(col_width,date) + 1)) + " ||"
  end

  def self.print_amount(col_width, amount)
    if amount > 0
      print (" " * spaces(col_width,amount)) + stringify_amount(amount) + " ||"
      print (" " * col_width) + " ||"
    else
      print (" " * col_width) + " ||"
      print (" " * spaces(col_width,amount)) + stringify_amount(amount) + " ||"
    end
  end

  def self.stringify_amount(amount)
    "%.2f" % (amount / 1.0)
  end

  def self.stringify_date(date)
    date.strftime('%d/%m/%Y')
  end

  def self.spaces(col_width, value)
    (col_width - value.to_s.length) - 1
  end

end
