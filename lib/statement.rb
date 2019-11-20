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

  def check_type_and_add_formatted_entry(last_deposit, balance)
    
    if last_deposit > 0
      entry = date + deposit + format('%.2f', balance)
    else
      entry = date + withdraw + format('%.2f', balance)
    end

    @transactions << entry
    
  end

end