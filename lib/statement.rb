# frozen_string_literal: true

# account History class
class Statement
  HEADERS = 'date || credit || debit || balance'

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def credit_transaction(amount, balance)
    @transactions.push(["#{date} || #{value(amount)} || || #{balance_format(balance)}"])
  end

  def debit_transaction(amount, balance)
    @transactions.push(["#{date} || || #{value(amount)} || #{balance_format(balance)}"])
  end

  def formatter
    transactions = @transactions.reverse.join("\n")
    "#{HEADERS}\n#{transactions}"
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
