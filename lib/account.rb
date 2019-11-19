# frozen_string_literal: true

require_relative 'statement'

# Bank account class
class Account
  START_BALANCE = 0
  OVERDRAFT_LIMIT = 0

  attr_reader :balance, :statement

  def initialize(name, statement = Statement.new)
    @name = name
    @statement = statement
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
    @statement.credit_transaction(amount, @balance)
  end

  def withdraw(amount)
    raise ArgumentError, 'Insufficient funds' unless (@balance - amount) >= OVERDRAFT_LIMIT

    @balance -= amount
    @statement.debit_transaction(amount, @balance)
  end

  def print_statement
    puts @statement.formatter
  end
end
