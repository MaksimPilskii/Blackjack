class Interface

  def initialize
    
  end

  def self.run
    puts "Введите свое имя "
    @name = gets.chomp
    @player = Player.new(@name)
    @dealer = Dealer.new
    @game = Game.new
  end
end

