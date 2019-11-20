class Statement

  attr_reader :entries, :lines

  def initialize
    @entries = []
    @lines = [' || ', '|| ']
  end

  def printer
    print header
    puts @entries.reverse
  end

  def header
    puts 'date || credit || debit || balance'
  end

  def display_entry(last_deposit, last_withdraw, last_date, balance)
    deposit = format('%.2f', last_deposit) + @lines[0] + @lines[1]
    withdraw = lines[1] + format('%.2f', last_withdraw) + lines[0]
    date = last_date + lines[0]

    if last_deposit.positive?
      entry = date + deposit + format('%.2f', balance)
      @entries << entry
    else
      entry = date + withdraw + format('%.2f', balance)
      @entries << entry
    end

    
  end

end