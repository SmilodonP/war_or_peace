require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

RSpec.configure do |config|
config.formatter = :documentation
end

RSpec.describe Turn do
  it "has a basic turn type" do
  	card1 = Card.new(:diamond, 'Queen', 12)
  	card2 = Card.new(:spade, '3', 3)
  	card3 = Card.new(:heart, 'Ace', 14)
  	card4 = Card.new(:club, '5', 5)
  	card5 = Card.new(:heart, '8', 8)
  	card6 = Card.new(:diamond, 'Queen', 12)
  	card7 = Card.new(:heart, '3', 3)
  	card8 = Card.new(:diamond, '2', 2)

  	deck1 = Deck.new([card1, card2, card5, card8])
  	deck2 = Deck.new([card3, card4, card6, card7])

  	player1 = Player.new("Megan", deck1)
  	player2 = Player.new("Aurora", deck2)
  
  	turn = Turn.new(player1, player2)

  	expect(turn.type).to eq(:basic)
		expect(turn.winner).to eq(player2)
  	expect(turn.pile_cards).to eq([card1, card3])
		expect(turn.spoils_of_war).to eq([card1, card3])
		#expect(player1.deck).to eq([card2, card5, card8])
		#expect(player2.deck).to eq([card4, card6, card7, card1, card3])
  end

  it "has a war turn type" do
		card1 = Card.new(:diamond, 'Queen', 12)
		card2 = Card.new(:spade, '3', 3)
		card3 = Card.new(:heart, 'Ace', 14)
		card4 = Card.new(:club, '5', 5)
		card5 = Card.new(:heart, '8', 8)
		card6 = Card.new(:diamond, 'Queen', 12)
		card7 = Card.new(:heart, '3', 3)
		card8 = Card.new(:diamond, '2', 2)
	
		deck1 = Deck.new([card1, card2, card5, card8])
		deck2 = Deck.new([card6, card3, card4, card7])
	
		player1 = Player.new("Megan", deck1)
		player2 = Player.new("Aurora", deck2)
		
		turn = Turn.new(player1, player2)	

		expect(turn.type).to eq(:war)
		expect(turn.winner).to eq(player1)
		expect(turn.pile_cards).to eq([card1, card2, card5, card6, card3, card4])
	end
end	
