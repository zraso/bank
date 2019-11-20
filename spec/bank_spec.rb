require 'bank'
require_relative 'test_helpers'

describe Bank do

  describe '#money_format' do
    it 'displays a given amount in the correct format' do
      first_deposit
      expect(subject.statement.entries[0]).to include '1000.00'
    end
  end

  describe '#add_date' do
    it 'returns a given date in the correct format' do
      expect(subject.add_date('10-01-2012')).to eq '10-01-2012'
    end
  end

  describe '#deposit' do
    it 'returns a given amount' do
      expect(subject.deposit(1000)).to eq 1000
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

  describe '#last_deposit' do
    it 'returns last deposit made' do
      first_deposit
      second_deposit
      expect(subject.last_deposit).to eq 2000
    end
  end

  describe '#last_date' do
    it "returns the last entry's date" do
      first_deposit
      second_deposit
      expect(subject.last_date).to eq '13-01-2012'
    end
  end

  describe '#display_entry' do
    it 'displays a deposit entry in the correct format' do
      first_deposit
      expect(subject.statement.entries).to include '10/01/2012 || 1000.00 || || 1000.00'
    end

    it 'displays a withdraw entry in the correct format' do
      second_deposit
      expect(subject.statement.entries).to include '13/01/2012 || 2000.00 || || 2000.00'
    end
  end

  describe '#confirm' do
    it 'saves the deposit and date as an entry' do
      second_deposit
      expect(subject.statement.entries).to eq ['13/01/2012 || 2000.00 || || 2000.00']
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
