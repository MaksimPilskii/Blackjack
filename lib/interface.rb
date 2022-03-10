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
    @game.scoring_points(@game.player.player_cards, @game.player.player_points, 'player')
    @game.scoring_points(@game.dealer.dealer_cards, @game.dealer.dealer_points, 'dealer')
    the_first_round
  end

  def the_first_round
    puts <<~END
      Игрок: #{@game.player.name}              Банк игрока: #{@game.player.player_bank}, Карты игрока: #{@game.player.player_cards}
      Очки игрока: #{@game.player.player_points}
      Дилер: Компьютер         Банк дилера: #{@game.dealer.dealer_bank}, Карты игрока:#{' '}
      Банк: #{@game.bank}
    END
    selection_menu
  end

  def selection_menu
    puts 'Выберите одно из действий '
    puts '1. Пропустить ход. Ход перейдет компьютеру'
    puts '2. Добавить карту. Может быть добавлена только одна карта'
    puts '3. Открыть карты'

    choise = gets.to_i
    @game.second_round(1)
  end
end
