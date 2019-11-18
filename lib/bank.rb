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

  def date_format(date)
    date.split("-").join("/")
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end