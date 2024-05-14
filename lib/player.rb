require './lib/card.rb'
require './lib/deck.rb'
require 'pry'

class Player
  attr_reader :name

	def initialize(name)
	@name = name
	end

end

