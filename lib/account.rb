# frozen_string_literal: true

# Bank account class
class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    @balance += amount
    @history.push(['%.2f' % amount, '%.2f' % @balance])
  end

  def withdraw(amount)
    @balance -= amount
    @history.push(['%.2f' % amount, '%.2f' % @balance])
  end

  def statement
    @history[-1].join(", ")
  end
end
