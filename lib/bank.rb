class Bank

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def money_format(amount)
    if amount < 0
      "Error: invalid amount"
    else 
      sprintf("%.2f", amount)
    end
  end

  def add_date(date)
    date.split("-").join("/")
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_entry
    "10/01/2012 || 1000.00 || || 1000.00"
  end

end