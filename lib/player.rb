class Player
  def initialize(name)
    @name = name
    @player_bank = 100.to_i
    @player_cards = []
    @player_points = 0.to_i
  end
end