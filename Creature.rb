require_relative "map.rb"
class Creature

	def initialize(name=nil, positionx=nil, positiony=nil)
		@name = name || NAMES.sample
		@positionx = positionx || rand(MAP[0])
		@positiony = positiony || rand(MAP[1])
	end

end