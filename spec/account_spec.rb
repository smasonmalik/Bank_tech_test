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
  end

  describe '#balance' do
    it 'displays starting balance of 0' do
      expect(subject.balance).to eq 0
    end
  end
end
