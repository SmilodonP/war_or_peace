require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    
    

    
  #       #this method will return an array of cards in the deck that have a rank of 11 or above 
  #       #(face cards and aces)
  # end
end
#     def percent_high_ranking
#         #this method will return the percentage of cards that are high ranking
#     end

#     def remove_card
#         #this method will remove the top card from the deck
#     end

#     def add_card
#         #this method will add one card to the bottom (end) of the deck
#     end
# end
