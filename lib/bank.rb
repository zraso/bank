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

  def display_entry
    if @last_deposit > 0
      @last_date + " || " + money_format(@last_deposit) + " || " + "|| " + money_format(@balance)
    else
      @last_date + " || " + "|| " + money_format(@last_withdraw) + " || " + money_format(@balance)
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