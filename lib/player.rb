# frozen_string_literal: true

class Player
  attr_accessor :name, :player_bank, :player_cards, :player_points

  def initialize
    @name = Interface.add_name
    @player_bank = 100
    @player_cards = []
    @player_points = 0
  end
end
