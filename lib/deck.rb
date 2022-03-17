class Deck
  attr_accessor :deck, :all_cards, :suit, :value

  def initialize
    @deck = []
    @card = Card.new
    @all_cards = []
    new_deck
  end

  def all_cards
    @card.suit.each do |suit|
      @card.value.each do |card|
        @all_cards << "#{card}#{suit}"
      end
    end
  end

  def new_deck
    all_cards
    @deck = @all_cards
  end
end