# frozen_string_literal: true

require 'statement'

describe Statement do
  credit_transaction_one = ['19/11/2019 || 100.00 || || 100.00']
  credit_transaction_two = ['19/11/2019 || 100.00 || || 200.00']
  debit_transaction_one = ['19/11/2019 || || 50.00 || 50.00']
  debit_transaction_two = ['19/11/2019 || || 50.00 || 150.00']

  describe '#statement' do
    it 'returns the date, amount and balance of last credit action today' do
      subject.add_to_statement(credit_transaction_one)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      '19/11/2019 || 100.00 || || 100.00'
    end

    it 'returns the informatterion on last 2 credit actions today' do
      subject.add_to_statement(credit_transaction_one)
      subject.add_to_statement(credit_transaction_two)
      p subject.statement
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "19/11/2019 || 100.00 || || 200.00\n"\
                                      '19/11/2019 || 100.00 || || 100.00'
    end

    it 'returns the date, amount and balance of last 2 transactions today' do
      subject.add_to_statement(credit_transaction_one)
      subject.add_to_statement(debit_transaction_one)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "19/11/2019 || || 50.00 || 50.00\n"\
                                      '19/11/2019 || 100.00 || || 100.00'
    end

    it 'returns the date, amount and balance of last 3 trasnactions ' do
      subject.add_to_statement(credit_transaction_one)
      subject.add_to_statement(credit_transaction_two)
      subject.add_to_statement(debit_transaction_two)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "19/11/2019 || || 50.00 || 150.00\n"\
                                      "19/11/2019 || 100.00 || || 200.00\n"\
                                      '19/11/2019 || 100.00 || || 100.00'
    end
  end
end
