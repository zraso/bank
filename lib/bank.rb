class Bank
  attr_reader :balance, :last_deposit, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @last_deposit = 0
    @statement = statement
  end

  def deposit(amount)
    raise_error(amount)
    @last_deposit = amount
    @statement.format_deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise_error(amount)
    @last_deposit = 0
    @statement.format_withdraw(amount)
    @balance -= amount
  end

  def add_date(date)
    @statement.format_date(date)
  end

  def confirm
    @statement.display_entry(@last_deposit, @balance)
  end

  private

  def raise_error(amount)
    raise 'Error: incorrect format' unless amount.is_a? Integer
    raise 'Error: invalid amount' if amount.negative?
  end

end
