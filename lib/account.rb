# frozen_string_literal: true

# Bank account class
class Account

  HEADERS = 'date || credit || debit || balance'
  START_BALANCE = 0
  OVERDRAFT_LIMIT = 0

  attr_reader :balance, :history

  def initialize
    @balance = START_BALANCE
    @history = []
  end

  def deposit(amount)
    @balance += amount
    @history.push(["#{date} || #{value(amount)} || || #{balance_format}"])
  end

  def withdraw(amount)
    raise ArgumentError, 'Insufficient funds' unless (@balance-amount) >= OVERDRAFT_LIMIT

    @balance -= amount
    @history.push(["#{date} || || #{value(amount)} || #{balance_format}"])
  end

  def statement
    transaction = @history.reverse.join("\n")
    "#{HEADERS}\n#{transaction}"
  end

  private

  def date
    Date.today.strftime('%d/%m/%Y')
  end

  def value(amount)
    '%.2f' % amount
  end

  def balance_format
    '%.2f' % @balance
  end
end
