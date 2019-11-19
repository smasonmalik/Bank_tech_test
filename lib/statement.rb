# frozen_string_literal: true

# account History class
class Statement
  HEADERS = 'date || credit || debit || balance'

  attr_reader :statement

  def initialize
    @statement = []
  end

  def add_to_statement(transaction)
    @statement.push(transaction)
  end

  def formatter
    statement = @statement.reverse.join("\n")
    "#{HEADERS}\n#{statement}"
  end
end
