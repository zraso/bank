class Statement

  attr_reader :transactions, :lines, :deposit, :withdraw, :date

  def initialize
    @transactions = []
    @lines = [' || ', '|| ']
    @deposit = ""
    @withdraw = ""
    @date = ""
  end

  def printer
    print header
    puts @transactions.reverse
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def format_date(date)
    @date = date.split('-').join('/') + lines[0]
  end

  def format_deposit(amount)
    @deposit = format('%.2f', amount) + @lines[0] + @lines[1]
  end

  def format_withdraw(amount)
    @withdraw = lines[1] + format('%.2f', amount) + lines[0]
  end

  def add_deposit_string(balance)
    @transactions << (date + deposit + format('%.2f', balance))
  end

  def add_withdrawal_string(balance)
    @transactions << (date + withdraw + format('%.2f', balance))
  end
  
end