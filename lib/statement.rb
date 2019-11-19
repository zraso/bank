class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  # def header
  #   puts "date || credit || debit || balance"
  # end
  # def format_transaction
  #   "10/01/2012 || 1000.00 || || 1000.00"
  # end

  # def print_statement
  #   print header
  #   puts @entries.reverse
  # end

  # def display_entry
  #   lines = [' || ', '|| ']
  #   deposit = format('%.2f', @last_deposit) + lines[0] + lines[1]
  #   withdraw = lines[1] + format('%.2f', @last_withdraw) + lines[0]
  #   date = @last_date + lines[0]

  #   if @last_deposit.positive?
  #     date + deposit + format('%.2f', @balance)
  #   else
  #     date + withdraw + format('%.2f', @balance)
  #   end
  # end

  # def header
  #   puts 'date || credit || debit || balance'
  # end

end