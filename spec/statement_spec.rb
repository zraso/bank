# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:bank) { double :bank }

  describe '#printer' do
    it 'displays deposit transaction in correct format' do
      statement.transactions << '13/01/2012 || 2000.00 || || 2000.00'
      expect { statement.printer }.to output("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end

    it 'displays withdraw transaction in correct format' do
      statement.transactions << '13/01/2012 || 2000.00 || || 2000.00'
      statement.transactions << '14/01/2012 || || 500.00 || 1500.00'
      expect { statement.printer }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 1500.00\n13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end
  end
end
