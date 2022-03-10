class Interface
  attr_accessor :player, :dealer, :game, :name, :deck
  
  def self.add_name
    puts "Введите ваше имя"
    @name = gets.chomp
  end
  
  def run
    @game = Game.new
  end
end
