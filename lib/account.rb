# frozen_string_literal: true

# Bank account class
class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount, date = Date.today)
    @balance += amount
    @history.push(["#{date}, #{'%.2f' % amount}, #{'%.2f' % @balance}"])
  end

  # def withdraw(amount)
  #   @balance -= amount
  #   @history.push(['%.2f' % amount, format('%.2f', @balance)])
  # end

  def statement
    @history.join("\n")
  end
end
