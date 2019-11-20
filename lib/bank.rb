class Bank
  attr_reader :balance, :type, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    type = ""
    @statement = statement
  end

  def add_date(date)
    @statement.format_date(date)
  end

  def deposit(amount)
    raise_errors(amount)
    @balance += amount
    @type = "deposit"
    @statement.format_deposit(amount)
    add_transaction_to_statement
  end

  def withdraw(amount)
    raise_errors(amount)
    @balance -= amount
    @type = "withdraw"
    @statement.format_withdraw(amount)
    add_transaction_to_statement
  end

  private

  def add_transaction_to_statement
    if @type == "deposit"
      @statement.add_deposit_string(balance)
    else
      @statement.add_withdrawal_string(balance)
    end
  end

  def raise_errors(amount)
    raise 'Error: incorrect format' unless amount.is_a? Integer
    raise 'Error: invalid amount' if amount.negative?
  end

end
