# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#credit_transaction' do
    it 'stores a credit transaction as a string' do
      expect(subject.credit_transaction(100, 100)).to eq ["#{Time.now.strftime('%d/%m/%Y')} || 100.00 || || 100.00"]
    end
  end

  describe '#debit_transaction' do
    it 'stores a debit transaction as a string' do
      expect(subject.debit_transaction(100, 100)).to eq ["#{Time.now.strftime('%d/%m/%Y')} || || 100.00 || 100.00"]
    end
  end
end
