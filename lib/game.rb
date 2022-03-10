class Game
  attr_accessor :player, :dealer, :deck, :bank, :name, :deck

  def initialize
    @bank = 0
    @deck = Deck.new 
    @player = Player.new
    @dealer = Dealer.new
  end
end