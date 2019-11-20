class Bank
  attr_reader :balance, :type, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    type = ""
    @statement = statement
  end

  def deposit(amount)
    raise_error(amount)
    @last_deposit = amount
    @type = "deposit"
    @statement.format_deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise_error(amount)
    @type = ""
    @statement.format_withdraw(amount)
    @balance -= amount
  end

  def add_date(date)
    @statement.format_date(date)
  end

  def check_type
    if @type == "deposit"
      @statement.add_deposit_string(balance)
    else
      @statement.add_withdrawal_string(balance)
    end
  end

  private

  def raise_error(amount)
    raise 'Error: incorrect format' unless amount.is_a? Integer
    raise 'Error: invalid amount' if amount.negative?
  end

end
