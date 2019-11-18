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

  describe '#date_display' do
    it 'displays a given date in the correct format' do
      expect(subject.date_format("10-01-2012")).to eq "10/01/2012"
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
end