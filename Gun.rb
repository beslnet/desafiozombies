require_relative "Creature.rb"
require "pp"

class Gun < Creature
	
	def initialize(name=nil, positionx=nil, positiony=nil)
		@name = name || "#{ARMS.sample}"
		@positionx = positionx || rand(MAP[0])
		@positiony = positiony || rand(MAP[1])
	end

end