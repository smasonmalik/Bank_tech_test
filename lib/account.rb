# frozen_string_literal: true

require_relative 'history'

# Bank account class
class Account
  START_BALANCE = 0
  OVERDRAFT_LIMIT = 0

  attr_reader :balance, :history

  def initialize(name, history = History.new)
    @name = name
    @history = history
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
    @history.credit_transaction(amount, @balance)
  end

  def withdraw(amount)
    raise ArgumentError, 'Insufficient funds' unless (@balance - amount) >= OVERDRAFT_LIMIT

    @balance -= amount
    @history.debit_transaction(amount, @balance)
  end

  def print_statement
    puts @history.statement
  end
end
