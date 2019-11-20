# frozen_string_literal: true

require 'bank'
require_relative 'test_helpers'

describe Bank do
  let(:statement) { double :statement, format_deposit: "1000.00", format_withdraw: "500.00", transactions: ['10/01/2012 || 1000.00 || || 1000.00'] }

  describe '#add_date' do
    it 'formats given amount' do
      date = "10-12-2012"
      allow(statement).to receive(:format_date) { "10/12/2012 || " }
      expect(subject.add_date(date)).to eq "10/12/2012 || "
    end
  end

  describe '#deposit' do

    it 'raises an error if given amount is an invalid amount' do
      expect { subject.deposit(-3000) }.to raise_error('Error: invalid amount')
    end

    it 'raises an error if given amount is incorrect format' do
      expect { subject.deposit('3000') }.to raise_error('Error: incorrect format')
    end

    it 'it adds to the balance' do
      first_deposit
      second_deposit
      expect(subject.balance).to eq 3000
    end

    it 'sets type to deposit' do
      first_deposit
      expect(subject.type).to eq 'deposit'
    end

  end

  describe '#withdraw' do
    it 'when there is a deposit and a withdrawal, it returns correct balance' do
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
end
