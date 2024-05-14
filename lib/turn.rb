class Turn
require 'pry'
	attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type 
		if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
			@type = :basic
		elsif deck1.rank.at(0) == deck2.rank.at(0) 
			@type = :war
		else
			@type = :mutually_assured_destruction
		end
  end

	def winner
		if @type == :basic
			if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) 
				winner = player1
			else
				winner = player2
			end

		elsif @type == :war 
			if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
				winner = player1
			else
				winner = player2
			end
		
		else #@type == :mutually_assured_destruction
			"Everybody Loses & Nobody Wins!"
		end
	end

	def pile_cards
		if type == :basic
			spoils_of_war.append(player1.deck.remove_card)
			spoils_of_war.append(player2.deck.remove_card)
		

		elsif type == :war
			spoils_of_war << player1.deck(0,1,2) 
			spoils_of_war << player2.deck(0,1,2)  
		

		else 
			deck1.delete_at(0,1,2)
			deck1.delete_at(0,1,2)
		end
	end

	def award_spoils
		spoils_of_war.each {|card| winner.deck.add_card(card)}
		
	end
		
			
	

	
end


