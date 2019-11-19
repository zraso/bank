class Statement

  attr_reader :entries

  def initialize
    @entries = []
  end

 

  def printer
    print header
    puts @entries.reverse
  end

  private
  def header
    puts 'date || credit || debit || balance'
  end

end