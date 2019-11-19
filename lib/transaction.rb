# frozen_string_literal: true

# stores the current transaction as a string
class Transaction
  attr_reader :transaction

  def initialize
    @transaction = ''
  end

  def credit_transaction(amount, balance)
    @transaction = ["#{date} || #{value(amount)} || || #{balance_format(balance)}"]
  end

  def debit_transaction(amount, balance)
    @transaction = ["#{date} || || #{value(amount)} || #{balance_format(balance)}"]
  end

 private

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def value(amount)
    format('%.2f', amount)
  end

  def balance_format(balance)
    format('%.2f', balance)
  end
end
