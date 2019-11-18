# frozen_string_literal: true

require 'account'

describe Account do
  describe '#balance' do
    it 'displays balance' do
      expect(subject.balance).to eq 0
    end
  end
end
