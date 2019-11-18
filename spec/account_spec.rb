# frozen_string_literal: true

require 'account'

describe Account do
  describe '#deposit' do
    it 'reponds to #deposit' do
      expect(subject).to respond_to(:deposit)
    end

    it 'deposits an amount and adds to balance' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end

    it 'deposits an amount and adds to balance' do
      subject.deposit(5)
      expect(subject.balance).to eq 5
    end
  end

  describe '#balance' do
    it 'displays starting balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#withdraw' do
    it 'displays starting balance of 0' do
      expect(subject).to respond_to(:withdraw)
    end

    it 'withdraws an amount and subtracts from balance' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.balance).to eq 0
    end
  end

  describe '#display' do
    it 'returns the the last transaction and new balance' do
      subject.deposit(100)
      expect(subject.statement).to eq ('100.00, 100.00')
    end

    it 'returns the the last transaction and new balance' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.statement).to eq ('50.00, 50.00')
    end

    it 'returns the the last 2 transactions and new balance' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.statement).to eq ("100.00, 100.00\n50.00, 50.00")
    end
  end

end
