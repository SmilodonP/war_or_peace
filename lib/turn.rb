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

		elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
						
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
			for i in 0..2 do
				spoils_of_war.append(player1.deck.remove_card)
			end
			for i in 0..2 do
				spoils_of_war.append(player2.deck.remove_card)
			end
	
		else 
			for i in 0..2 do
				player1.deck.remove_card
			end
			for i in 0..2 do
				player2.deck.remove_card
			end

		end
	end

	def award_spoils
		spoils_of_war.each {|card| winner.deck.add_card(card)}
		
	end
		
			
	

	
end


