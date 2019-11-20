class Statement

  attr_reader :entries, :lines, :deposit, :withdraw, :date

  def initialize
    @entries = []
    @lines = [' || ', '|| ']
    @deposit = ""
    @withdraw = ""
    @date = ""
  end

  def printer
    print header
    puts @entries.reverse
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

  def display_entry(last_deposit, balance)
    
    if last_deposit.positive?
      entry = date + deposit + format('%.2f', balance)
      @entries << entry
    else
      entry = date + withdraw + format('%.2f', balance)
      @entries << entry
    end
    
  end

end