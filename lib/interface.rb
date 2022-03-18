# frozen_string_literal: true

class Interface
  attr_accessor :player, :dealer, :game, :name, :deck, :player_cards, :dealer_cards, :interface, :winner

  def self.add_name
    puts 'Введите ваше имя'
    @name = gets.chomp
  end

  def self.watch_cards(cards)
    cards.each do |card|
      print " #{card.value}#{card.suit} "
    end
  end

  def self.run
    @game = Game.new
    @game.place_a_bet
    the_first_round
  end

  def self.get_scoring
    @game.player.player_points = 0
    @game.dealer.dealer_points = 0
    @game.scoring_points(@game.player.player_cards, @game.player.player_points, 'player')
    @game.scoring_points(@game.dealer.dealer_cards, @game.dealer.dealer_points, 'dealer')
  end

  def self.the_first_round
    get_scoring
    puts
    puts "Игрок: #{@game.player.name} "
    print "Банк игрока: #{@game.player.player_bank} "
    print ', карты игрока: '
    watch_cards(@game.player.player_cards)
    puts ",очки игрока: #{@game.player.player_points}"
    puts 'Дилер: Компьютер '
    puts "Банк дилера: #{@game.dealer.dealer_bank}, карты дилера: \"***\""
    puts "Банк: #{@game.bank}"
    puts
    selection_menu
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
    the_first_round
  end

  def self.next_round
    if @game.player.player_cards.count > 2 && @game.dealer.dealer_cards.count > 2
      @game.open_cards
    else
      the_first_round
    end
  end

  def self.final
    show_cards
  end

  def self.show_cards
    get_scoring
    puts
    print 'Карты Дилера: '
    watch_cards(@game.dealer.dealer_cards)
    puts "набрано: #{@game.dealer.dealer_points}"
    print 'Ваши карты: '
    watch_cards(@game.player.player_cards)
    puts "набрано #{@game.player.player_points}"
    puts "Результат #{@game.winner}"
    puts 'Для продолжения игры нажмите 1, если хотите выйти, нажмите 0'
    choice = gets.to_i
    continue_the_game(choice)
  end

  def self.continue_the_game(choice)
    if choice == 1
      @game.place_a_bet
      the_first_round
    end
  end
end
