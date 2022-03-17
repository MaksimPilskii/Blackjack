class Card

  attr_accessor :value, :suit
  
  def initialize
    @value = %w(2 3 4 5 6 7 8 9 10 J L K A)
    @suit = %w(+ <3 ^ <>)
  end

end