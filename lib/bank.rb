class Bank

  attr_reader :balance, :last_deposit, :last_date, :entries, :last_withdraw

  def initialize
    @balance = 0
    @last_deposit = 0
    @last_withdraw = 0
    @last_date = nil
    @entries = []
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
    @last_withdraw = 0
    @last_deposit = amount
  end

  def withdraw(amount)
    @balance -= amount
    @last_deposit = 0
    @last_withdraw = amount
  end

  def confirm
    @entries << display_entry
  end

  #this can be broken out into a new class
  def display_entry
    lines = [" || ", "|| "]
    deposit = money_format(@last_deposit) + lines[0] + lines[1]
    withdraw = lines[1] + money_format(@last_withdraw) + lines[0]
    date = @last_date + lines[0]

    if @last_deposit > 0
      date + deposit + money_format(@balance)
    else
      date + withdraw + money_format(@balance)
    end
  end

  def print_statement
    print header
    puts @entries.reverse
  end

  private

  def header
    puts "date || credit || debit || balance"
  end

end