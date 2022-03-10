class Game
  attr_accessor :player, :dealer, :deck, :bank, :name, :deck

  def initialize
    @bank = 0
    @deck = Deck.new 
    @player = Player.new
    @dealer = Dealer.new
  end
  
  def place_a_bet
    @bank += 20
    @player.player_bank -= 10
    @dealer.dealer_bank -= 10
  end

  def distribution_of_cards
    2.times do 
      player.player_cards << deck.deck.sample
      dealer.dealer_cards << deck.deck.sample
    end
  end
end