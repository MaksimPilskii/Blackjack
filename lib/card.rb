# frozen_string_literal: true

class Card
  attr_accessor :value, :suit, :all_cards

  VALUE = %w[2 3 4 5 6 7 8 9 10 J L K A].freeze
  SUIT = %w[+ <3 ^ <>].freeze

  def self.all_cards
    @all_cards ||= []
  end

  def initialize(suit, value)
    @value = value
    @suit = suit
    self.class.all_cards << self
  end

  def self.create_new_card
    SUIT.each do |suit|
      VALUE.each do |value|
        Card.new(suit, value)
      end
    end
  end
end
