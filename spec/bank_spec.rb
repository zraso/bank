require 'bank'

describe Bank do
  describe '#deposit_display' do
    it 'displays a given amount in the correct format' do
      expect(subject.money_format(3000)).to eq "3000.00"
      expect(subject.money_format(100.53)).to eq "100.53"
    end

    it 'throws an if given amount is an invalid amount' do
      expect(subject.money_format(-2000)).to eq "Error: invalid amount"
    end

    # it 'throws an error if given amount is incorrect format' do
    #   expect(deposit_display("2000")).to eq "Error: incorrect format"
    # end
  end

  describe '#add_date' do
    it 'returns a given date in the correct format' do
      expect(subject.add_date("10-01-2012")).to eq "10/01/2012"
    end
  end

  describe '#deposit' do
    it 'returns a given amount' do
      expect(subject.deposit(1000)).to eq 1000
    end
    
    it 'it adds to the balance' do
      subject.deposit(1000)
      subject.deposit(2000)
      expect(subject.balance).to eq 3000
    end
  end

  describe '#withdraw' do
    it 'when there is an amount and a withdrawal, it returns the difference of the amounts' do
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.balance).to eq 2500
    end
  end

  describe '#last_deposit' do
    it 'returns last deposit made' do
      subject.deposit(1000)
      subject.deposit(2000)
      expect(subject.last_deposit).to eq 2000
    end
  end

  describe '#last_date' do
    it "returns the last entry's date" do
      subject.deposit(1000)
      subject.add_date("10/01/2012")
      subject.deposit(2000)
      subject.add_date("13/01/2012")
      expect(subject.last_date).to eq "13/01/2012"
    end
  end
  

  describe '#print_last_entry' do
    it 'displays an entry in the correct format' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      expect(subject.display_entry).to eq "10/01/2012 || 1000.00 || || 1000.00"
    end

    it 'displays an entry in the correct format' do
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      expect(subject.display_entry).to eq "13/01/2012 || 2000.00 || || 2000.00"
    end
  end

  describe '#confirm' do
    it 'saves the deposit and date as an entry' do
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect(subject.entries).to eq ["13/01/2012 || 2000.00 || || 2000.00"]
    end
  end

  describe '#print_statement' do
    it 'when one deposit, prints date, amount and balance with header' do
      subject.deposit(1000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n13/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when two deposits, prints statement date, amount and balance' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'when deposit and withdrawal, prints statement date, amount and balance' do
      subject.deposit(1000)
      subject.add_date("10-01-2012")
      subject.confirm
      subject.deposit(2000)
      subject.add_date("13-01-2012")
      subject.confirm
      subject.withdraw(500)
      subject.add_date("14-01-2012")
      subject.confirm
      expect{subject.print_statement}.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end

## Edge case: Saves to balance even without confirm