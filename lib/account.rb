# frozen_string_literal: true

# Bank account class
class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount, date = Date.today.strftime("%d-%m-%Y"))
    @balance += amount
    @history.push(["#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}"])
  end

  def withdraw(amount, date = Date.today)
    raise ArgumentError, 'Insufficient funds' unless @balance >= amount

    @balance -= amount
    @history.push(["#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}"])
  end

  def statement
    transaction = @history.reverse.join("\n")
    headers = 'date || credit || debit || balance'
    "#{headers}\n#{transaction}"
  end
end
