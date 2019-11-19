# frozen_string_literal: true

require_relative 'statement'
require_relative 'transaction'

# Bank account class
class Account
  START_BALANCE = 0
  OVERDRAFT_LIMIT = 0

  attr_reader :balance

  def initialize(name, statement = Statement.new, transaction = Transaction.new)
    @name = name
    @transaction = transaction
    @statement = statement
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
    @transaction.credit_transaction(amount, @balance)
    @statement.add_to_statement(@transaction.transaction)
  end

  def withdraw(amount)
    raise ArgumentError, 'Insufficient funds' unless (@balance - amount) >= OVERDRAFT_LIMIT

    @balance -= amount
    @transaction.debit_transaction(amount, @balance)
    @statement.add_to_statement(@transaction.transaction)
  end

  def print_statement
    puts @statement.formatter
  end
end
