# frozen_string_literal: true

class Deck
  attr_accessor :deck, :all_cards

  CARDS = %w[2 3 4 5 6 7 8 9 10 J L K A].freeze
  SUITS = %w[+ <3 ^ <>].freeze

  def initialize
    @deck = []
    @all_cards = []
    new_deck
  end

  def all_cards
    SUITS.each do |suit|
      CARDS.each do |card|
        @all_cards << "#{card}#{suit}"
      end
    end
  end

  def new_deck
    all_cards
    @deck = @all_cards
  end
end
