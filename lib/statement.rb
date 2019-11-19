class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def printer
    print header
    puts @transactions.reverse
  end

  private

  def header
    puts 'date || credit || debit || balance'
  end

end