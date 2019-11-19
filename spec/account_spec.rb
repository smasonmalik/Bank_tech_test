# frozen_string_literal: true

require 'account'

describe Account do
  subject(:subject) { described_class.new('user101') }
  statement = "date || credit || debit || balance\n"\
                 "19/11/2019 || 50.50 || || 151.25\n"
  let(:history) { double(:history, statement: statement) }
  let(:account) { Account.new('sid', history) }

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
    it 'displays starting balance equal to START_BALANCE' do
      expect(subject.balance).to eq Account::START_BALANCE
    end
  end

  describe '#print_statement' do
    it 'print bank statement of historic transactions' do
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end
