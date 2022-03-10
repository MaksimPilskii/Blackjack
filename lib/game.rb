# frozen_string_literal: true

class Game
  attr_accessor :player, :dealer, :deck, :bank, :name, :player_cards, :dealer_cards, :interface, :winner

  def initialize
    @bank = 0
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @winner = winner
  end

  def place_a_bet
    @bank += 20
    @player.player_bank -= 10
    @dealer.dealer_bank -= 10
    distribution_of_cards
  end

  def distribution_of_cards
    2.times do
      @player.player_cards << deck.deck.sample
      @dealer.dealer_cards << deck.deck.sample
    end
    scoring_points(player.player_cards, player.player_points, player)
  end

  def add_cards(player)
    @dealer.dealer_cards << deck.deck.sample if player == 'dealer'
    @player.player_cards << deck.deck.sample if player == 'player'
    Interface.the_first_round
  end

  def scoring_points(cards, player_points, player)
    cards.each do |card|
      place_in_the_array = @deck.deck.index(card) % 13 + 1

      case place_in_the_array
      when 1..9
        player_points += (place_in_the_array + 1)
      when 10..12
        player_points += 10
      when 13
        player_points += if player_points >= 17
                           1
                         else
                           11
                         end
      end
    end
    @player.player_points += player_points if player == 'player'
    @dealer.dealer_points += player_points if player == 'dealer'
  end

  def second_round(number)
    case number
    when 1
      skip_a_move
    when 2
      add_a_card
    when 3
      open_cards
    end
  end

  def skip_a_move
    if @dealer.dealer_points < 17
      puts 'Компьютер взял еще одну карту'
      add_cards('dealer')
    else
      puts 'Компьютер пропускает ход'
      Interface.the_first_round
    end
  end

  def add_a_card
    if @player.player_cards.count < 3
      add_cards('player')
    else
      Interface.warning
    end
  end

  def open_cards
    if @player.player_points > @dealer.dealer_points
      @winner = @player.name
    elsif @player.player_points < @dealer.dealer_points
      @winner = 'Дилер'
    else
      @winner = 'Ничья'
    end
      @winner
  end
end
