# frozen_string_literal: true

require 'statement'

describe Statement do
  describe '#credit_transaction' do
    it 'stores the last credit transaction' do
      subject.credit_transaction(50, 50)
      expect(subject.transactions[0]).to eq ["#{Date.today.strftime("%d/%m/%Y")} "\
                                               '|| 50.00 || || 50.00']
    end
  end

  describe '#debit_transaction' do
    it 'stores the last debit transaction' do
      subject.credit_transaction(100, 100)
      subject.debit_transaction(50, 50)
      expect(subject.transactions[1]).to eq ["#{Date.today.strftime("%d/%m/%Y")} "\
                                               '|| || 50.00 || 50.00']
    end
  end

  describe '#statement' do
    it 'returns the date, amount and balance of last credit action today' do
      subject.credit_transaction(100, 100)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "#{Date.today.strftime("%d/%m/%Y")} "\
                                      '|| 100.00 || || 100.00'
    end

    it 'returns the informatterion on last 2 credit actions today' do
      subject.credit_transaction(100.75, 100.75)
      subject.credit_transaction(50.50, 151.25)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "19/11/2019 || 50.50 || || 151.25\n"\
                                      '19/11/2019 || 100.75 || || 100.75'
    end

    it 'returns the date, amount and balance of last 2 transactions today' do
      subject.credit_transaction(100.10, 100.10)
      subject.debit_transaction(50.25, 49.85)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "19/11/2019 || || 50.25 || 49.85\n"\
                                      '19/11/2019 || 100.10 || || 100.10'
    end

    it 'returns the date, amount and balance of last 3 trasnactions ' do
      allow(subject).to receive(:date) { '10/01/2019' }
      subject.credit_transaction(1000, 1000)
      allow(subject).to receive(:date) { '13/01/2019' }
      subject.credit_transaction(2000, 3000)
      allow(subject).to receive(:date) { '14/01/2019' }
      subject.debit_transaction(500, 2500)
      expect(subject.formatter).to eq "date || credit || debit || balance\n"\
                                      "14/01/2019 || || 500.00 || 2500.00\n"\
                                      "13/01/2019 || 2000.00 || || 3000.00\n"\
                                      '10/01/2019 || 1000.00 || || 1000.00'
    end
  end
end
