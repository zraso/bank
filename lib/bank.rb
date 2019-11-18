class Bank

  attr_reader :balance, :last_deposit, :last_date

  def initialize
    @balance = 0
    @last_deposit = 0
    @last_date = nil
  end

  def money_format(amount)
    if amount < 0
      "Error: invalid amount"
    else 
      sprintf("%.2f", amount)
    end
  end

  def add_date(date)
    @last_date = date.split("-").join("/")
  end

  def deposit(amount)
    @balance += amount
    @last_deposit = amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_entry
    @last_date + " || " + money_format(@last_deposit) + " || " + "|| " + money_format(@balance)
  end

  def print_statement
    print header
    puts display_entry
  end

  private

  def header
    puts "date || credit || debit || balance"
  end

end