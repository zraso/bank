require 'bank'
require_relative 'test_helpers'

describe Bank do

  describe '#money_format' do
    it 'displays a given amount in the correct format' do
      first_deposit
      expect(subject.statement.transactions[0]).to include '1000.00'
    end
  end

  describe '#deposit' do
    it 'returns sets type to deposit' do
      first_deposit
      expect(subject.type).to eq "deposit"
    end

    it 'it adds to the balance' do
      first_deposit
      second_deposit
      expect(subject.balance).to eq 3000
    end

    it 'raises an if given amount is an invalid amount' do
      expect { subject.deposit(-3000) }.to raise_error('Error: invalid amount')
    end

    it 'raises an error if given amount is incorrect format' do
      expect { subject.deposit('3000') }.to raise_error('Error: incorrect format')
    end
  end

  describe '#withdraw' do
    it 'when there is an amount and a withdrawal, it returns correct balance' do
      first_deposit
      second_deposit
      withdrawal
      expect(subject.balance).to eq 2500
    end

    it 'raises an if given amount is an invalid amount' do
      expect { subject.withdraw(-3000) }.to raise_error('Error: invalid amount')
    end

    it 'raises an error if given amount is incorrect format' do
      expect { subject.withdraw('3000') }.to raise_error('Error: incorrect format')
    end
  end

  describe '#display_entry' do
    it 'displays a deposit entry in the correct format' do
      first_deposit
      expect(subject.statement.transactions).to include '10/01/2012 || 1000.00 || || 1000.00'
    end

    it 'displays a withdraw entry in the correct format' do
      second_deposit
      expect(subject.statement.transactions).to include '13/01/2012 || 2000.00 || || 2000.00'
    end
  end

  describe '#confirm' do
    it 'saves the deposit and date as an entry' do
      second_deposit
      expect(subject.statement.transactions).to eq ['13/01/2012 || 2000.00 || || 2000.00']
    end
  end

  describe '#print_statement' do
    it 'when one deposit, prints date, amount and balance with header' do
      first_deposit
      expect { subject.statement.printer }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when two deposits, prints statement date, amount and balance' do
      first_deposit
      second_deposit
      expect { subject.statement.printer }.to output("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when deposit and withdrawal, prints statement date, amount and balance' do
      first_deposit
      second_deposit
      withdrawal
      expect { subject.statement.printer }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
