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

  describe '#display' do
    it 'returns the date, amount and balance of last credit action today' do
      subject.deposit(100)
      expect(subject.statement).to eq "#{Date.today}, 100.00,  , 100.00"
    end

    it 'returns the date, amount and balance of last credit action yesterday' do
      subject.deposit(100, '2019-11-17')
      expect(subject.statement).to eq "#{Date.today - 1}, 100.00,  , 100.00"
    end

    it 'returns the information on last 2 credit actions today' do
      subject.deposit(100)
      subject.deposit(50)
      expect(subject.statement).to eq "#{Date.today}, 50.00,  , 150.00\n"\
                                      "#{Date.today}, 100.00,  , 100.00"
    end

    it 'returns the date, amount and balance of last 2 trasnactions ' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.statement).to eq "#{Date.today},  , 50.00, 50.00\n"\
                                      "#{Date.today}, 100.00,  , 100.00"
    end

    it 'returns the date, amount and balance of last 3 trasnactions ' do
      subject.deposit(100)
      subject.deposit(20)
      subject.withdraw(50)
      expect(subject.statement).to eq "#{Date.today},  , 50.00, 70.00\n"\
                                      "#{Date.today}, 20.00,  , 120.00\n"\
                                      "#{Date.today}, 100.00,  , 100.00"\
    end
  end

  describe '#withdraw' do
    it 'Account response to withdraw' do
      expect(subject).to respond_to(:withdraw)
    end

    it 'withdraws an amount and subtracts from balance' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.balance).to eq 0
    end

    it "stops withdrawl of money if funds less than withdrawl amount " do
      expect {subject.withdraw(100) }.to raise_error("Insufficient funds")
    end
  end

end


  #
  #   it 'withdraws an amount and subtracts from balance' do
  #     subject.deposit(10)
  #     subject.withdraw(10)
  #     expect(subject.balance).to eq 0
  #   end
