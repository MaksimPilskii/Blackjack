# frozen_string_literal: true

class Deck
  attr_accessor :deck

  def initialize
    Card.create_new_card
    @deck = Card.all_cards
  end
end
