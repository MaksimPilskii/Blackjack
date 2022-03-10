# frozen_string_literal: true

class Interface
  attr_accessor :player, :dealer, :game, :name, :deck, :player_cards, :dealer_cards

  def self.add_name
    puts 'Введите ваше имя'
    @name = gets.chomp
  end

  def run
    @game = Game.new
    @game.place_a_bet
    @game.scoring_points(@game.player.player_cards, @game.player.player_points, "player")
    @game.scoring_points(@game.dealer.dealer_cards, @game.dealer.dealer_points, "dealer")
    the_first_move
  end

  def the_first_move
    puts <<~END
      Игрок: #{@game.player.name}              Банк игрока: #{@game.player.player_bank}, Карты игрока: #{@game.player.player_cards}
      Очки игрока: #{@game.player.player_points}
      Дилер: Компьютер         Банк дилера: #{@game.dealer.dealer_bank}, Карты игрока: 
      Банк: #{@game.bank}
    END
  end

end
