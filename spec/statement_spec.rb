require 'statement'

describe Statement do

  subject(:statement) { described_class.new }
  let(:bank) {double :bank}

  describe '#printer' do
    it 'displays transactions in correct format' do
      statement.transactions << "13/01/2012 || 2000.00 || || 2000.00"
      expect { statement.printer }.to output("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end
  end



end
