# frozen_string_literal: true

require 'account'

describe Account do
  my_statement = "date || credit || debit || balance\n19/11/2019 || 50.50 || || 151.25"
  let(:history) { double(:history, statement: my_statement) }
  let(:account) { Account.new(history) }

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

  describe '#print_statement' do
    it 'print bank statement of historic transactions' do
      expect(account.print_statement).to eq my_statement
    end
  end
end

# describe '#display' do
#   it 'returns the date, amount and balance of last credit action today' do
#     subject.deposit(100)
#     expect(subject.print_statement).to eq "date || credit || debit || balance\n"\
#                                     "#{Date.today.strftime("%d/%m/%Y")} "\
#                                     '|| 100.00 || || 100.00'
#   end
#
#   it 'returns the information on last 2 credit actions today' do
#     allow(history).to receive(:date).and_return('17/11/2019')
#     subject.deposit(100.75)
#     subject.deposit(50.50)
#     expect(subject.print_statement).to eq "date || credit || debit || balance\n"\
#                                     "19/11/2019 || 50.50 || || 151.25\n"\
#                                     '19/11/2019 || 100.75 || || 100.75'
#   end
#
#   it 'returns the date, amount and balance of last 2 transactions ' do
#     # allow(history).to receive(:date).and_return('19/11/2019')
#     subject.deposit(100.10)
#     subject.withdraw(50.25)
#     expect(subject.print_statement).to eq "date || credit || debit || balance\n"\
#                                     "19/11/2019 || || 50.25 || 49.85\n"\
#                                     '19/11/2019 || 100.10 || || 100.10'
#   end
#
#   it 'returns the date, amount and balance of last 3 trasnactions ' do
#     subject.deposit(1000)
#     subject.deposit(2000)
#     subject.withdraw(500)
#     expect(subject.print_statement).to eq "date || credit || debit || balance\n"\
#                                     "19/11/2019 || || 500.00 || 2500.00\n"\
#                                     "19/11/2019 || 2000.00 || || 3000.00\n"\
#                                     '19/11/2019 || 1000.00 || || 1000.00'
#   end
# end
#
# describe '#withdraw' do
#   it 'Account response to withdraw' do
#     expect(subject).to respond_to(:withdraw)
#   end
#
#   it 'withdraws an amount and subtracts from balance' do
#     subject.deposit(10)
#     subject.withdraw(10)
#     expect(subject.balance).to eq 0
#   end
#
#   it 'stops withdrawl of money if funds would become less than overdraft limit' do
#     expect { subject.withdraw(100) }.to raise_error('Insufficient funds')
#   end
# end
