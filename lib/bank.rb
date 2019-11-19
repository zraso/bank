class Bank
  attr_reader :balance, :last_deposit, :last_date, :last_withdraw, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @last_deposit = 0
    @last_withdraw = 0
    @last_date = ""
    @statement = statement
  end

  def deposit(amount)
    raise_error(amount)
    @last_withdraw = 0
    @last_deposit = amount
  end

  def withdraw(amount)
    raise_error(amount)
    @last_deposit = 0
    @last_withdraw = amount
  end

  def add_date(date)
    @last_date = date.split('-').join('/')
  end

  def confirm
    if @last_deposit.positive?
      @balance += @last_deposit
    else
      @balance -= @last_withdraw
    end

    @statement.transactions << display_entry
  end

  private

  # this can be broken out into a new class
  def display_entry
    lines = [' || ', '|| ']
    deposit = format('%.2f', @last_deposit) + lines[0] + lines[1]
    withdraw = lines[1] + format('%.2f', @last_withdraw) + lines[0]
    date = @last_date + lines[0]

    if @last_deposit.positive?
      date + deposit + format('%.2f', @balance)
    else
      date + withdraw + format('%.2f', @balance)
    end
  end

  def header
    puts 'date || credit || debit || balance'
  end
  ###

  def raise_error(amount)
    raise 'Error: incorrect format' unless amount.is_a? Integer
    raise 'Error: invalid amount' if amount.negative?
  end
end
