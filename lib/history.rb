# frozen_string_literal: true

# account History class
class History
  HEADERS = 'date || credit || debit || balance'

  attr_reader :history

  def initialize
    @history = []
  end

  def credit_transaction(amount, balance)
    @history.push(["#{date} || #{value(amount)} || || #{balance_format(balance)}"])
  end

  def debit_transaction(amount, balance)
    @history.push(["#{date} || || #{value(amount)} || #{balance_format(balance)}"])
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

  def balance_format(balance)
    '%.2f' % balance
  end
end
