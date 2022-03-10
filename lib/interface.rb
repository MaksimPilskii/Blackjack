# frozen_string_literal: true

class Interface
  attr_accessor :player, :dealer, :game, :name, :deck, :player_cards, :dealer_cards, :interface, :winner

  def self.add_name
    puts 'Введите ваше имя'
    @name = gets.chomp
  end

  def self.run
    @game = Game.new
    @game.place_a_bet
    Interface.the_first_round
  end

  def self.get_scoring
    @game.player.player_points = 0
    @game.dealer.dealer_points = 0
    @game.scoring_points(@game.player.player_cards, @game.player.player_points, 'player')
    @game.scoring_points(@game.dealer.dealer_cards, @game.dealer.dealer_points, 'dealer')
  end

  def self.the_first_round
    Interface.get_scoring
    puts
    puts <<~END
      Игрок: #{@game.player.name}              Банк игрока: #{@game.player.player_bank}, Карты игрока: #{@game.player.player_cards}
      Очки игрока: #{@game.player.player_points}
      Дилер: Компьютер         Банк дилера: #{@game.dealer.dealer_bank}, Карты дилера: "***"
      Банк: #{@game.bank}
    END
    puts
    Interface.selection_menu
  end

  def self.selection_menu
    puts
    puts 'Выберите одно из действий '
    puts '1. Пропустить ход. Ход перейдет компьютеру'
    puts '2. Добавить карту. Может быть добавлена только одна карта'
    puts '3. Открыть карты'
    puts

    choise = gets.to_i
    @game.second_round(choise)
  end

  def self.warning
    puts 'Вы не можете больше брать карт'
    Interface.the_first_round
  end

  def self.next_round
    if @game.player.player_cards.count > 2 && @game.dealer.dealer_cards.count > 2
      @game.open_cards
    else
      Interface.the_first_round
    end
  end

  def self.final
    Interface.show_cards
  end

  def self.show_cards
    puts "Карты Дилера: #{@game.dealer.dealer_cards}, набрано #{@game.dealer.dealer_points}"
    puts "Карты  #{@game.player.player_cards}, набрано #{@game.player.player_points}"
    puts "Результат #{@game.winner}"
    puts 'Для продолжения игры нажмите 1, если хотите выйти, нажмите 0'
    choice = gets.to_i
    Interface.continue_the_game(choice)
  end

  def self.continue_the_game(choice)
    if choice == 1
      @game.place_a_bet
      Interface.the_first_round
    end
  end
end
