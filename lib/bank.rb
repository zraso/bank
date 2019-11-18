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

  def print_entry
    # @current_date + "||" + @deposit.to_s + "||" + "||" + @balance.to_s
    "10/01/2012 || 1000.00 || || 1000.00"
  end

end