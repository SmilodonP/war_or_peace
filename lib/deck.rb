require './lib/card'
require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.map{|x| x.rank >= 11 ? x : nil}.compact
  end

  
  def percent_high_ranking
    ((high_ranking_cards.length.to_f/@cards.length)*100).round(2)
  end
  

  def remove_card
    @cards.delete_at(0)
    @cards
  end

  def add_card(card)
    @cards.push(card)
  
  end

end

