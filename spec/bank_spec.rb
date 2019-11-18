require 'bank'

describe Bank do
  describe '#deposit_display' do
    it 'displays a given amount in the correct format' do
      expect(subject.money_format(1000)).to eq "1000.00"
      expect(subject.money_format(2000)).to eq "2000.00"
      expect(subject.money_format(3000)).to eq "3000.00"
      expect(subject.money_format(100.53)).to eq "100.53"
    end

    it 'throws an if given amount is an invalid amount' do
      expect(subject.money_format(-2000)).to eq "Error: invalid amount"
      expect(subject.money_format(-50)).to eq "Error: invalid amount"
    end

    # it 'throws an if given amount is incorrect format' do
    #   expect(deposit_display("2000")).to eq "Error: incorrect format"
    # end
  end

  describe '#date_display' do
    it 'displays a given date in the correct format' do
      expect(subject.date_format("10-01-2012")).to eq "10/01/2012"
      expect(subject.date_format("13-01-2012")).to eq "13/01/2012"
      expect(subject.date_format("31-02-2012")).to eq "31/02/2012"
    end
  end

  describe '#deposit' do
    it 'returns a given amount' do
      expect(subject.deposit(1000)).to eq 1000
    end
  end

  describe '#balance' do
    it 'when an amount is deposited, it returns the current balance' do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end

    it 'when two amounts are deposited, it returns balance equal to both deposits' do
      subject.deposit(1000)
      subject.deposit(2000)
      expect(subject.balance).to eq 3000
    end
  end
end