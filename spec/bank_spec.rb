require 'bank'

describe '#deposit_display' do
  it 'displays a given amount in the correct format' do
    expect(deposit_display(1000)).to eq "1000.00"
    expect(deposit_display(2000)).to eq "2000.00"
    expect(deposit_display(3000)).to eq "3000.00"
    expect(deposit_display(100.53)).to eq "100.53"
  end

  it 'throws an if given amount is an invalid amount' do
    expect(deposit_display(-2000)).to eq "Error: invalid amount"
    expect(deposit_display(-50)).to eq "Error: invalid amount"
  end

  # it 'throws an if given amount is incorrect format' do
  #   expect(deposit_display("2000")).to eq "Error: incorrect format"
  # end
end

describe '#date_display' do
  it 'displays a given date in the correct format' do
    expect(date_display("10-01-2012")).to eq "10/01/2012"
    expect(date_display("13-01-2012")).to eq "13/01/2012"
    # expect(date_display("31-02-2012")).to eq "31/02/2012"
  end
end