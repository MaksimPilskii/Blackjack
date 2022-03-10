# frozen_string_literal: true

class Dealer
  attr_accessor :dealer_bank, :dealer_cards, :dealer_points

  def initialize
    @dealer_bank = 100
    @dealer_cards = []
    @dealer_points = 0
  end
end
