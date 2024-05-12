class Card

  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  # def card1
  #   suit = diamond
	# 	value = 'Queen'
	# 	rank = 12
  # end

	# def card2
	# 	suit = spade
	# 	value = '3'
	# 	rank = 3
	# end

	# def card3
	# 	suit = heart
	# 	value = 'Ace'
	# 	rank = 14
	# end

end