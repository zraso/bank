require 'bank'

describe '#deposit_display' do
  it 'displays a given amount in the correct format' do
    expect(deposit_display(1000)).to eq 1000.00
  end
end