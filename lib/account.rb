# frozen_string_literal: true

# Bank account class
class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end
