# frozen_string_literal: true

class Bank
  attr_reader :balance, :last_deposit, :last_date, :entries, :last_withdraw

  def initialize
    @balance = 0
    @last_deposit = 0
    @last_withdraw = 0
    @last_date = nil
    @entries = []
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
      @entries << display_entry
    else
      @balance -= @last_withdraw
      @entries << display_entry
    end
  end

  def print_statement
    print header
    puts @entries.reverse
  end

  private

  def money_format(amount)
    format('%.2f', amount)
  end

  # this can be broken out into a new class
  def display_entry
    lines = [' || ', '|| ']
    deposit = money_format(@last_deposit) + lines[0] + lines[1]
    withdraw = lines[1] + money_format(@last_withdraw) + lines[0]
    date = @last_date + lines[0]

    if @last_deposit.positive?
      date + deposit + money_format(@balance)
    else
      date + withdraw + money_format(@balance)
    end
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def raise_error(amount)
    raise 'Error: incorrect format' unless amount.is_a? Integer
    raise 'Error: invalid amount' if amount.negative?
  end
end
