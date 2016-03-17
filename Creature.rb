require_relative "map.rb"
class Creature

	attr_accessor :name, :positionx, :positiony, :pickup_weapon

	def initialize(name=nil, positionx=10, positiony=10, pickup_weapon=nil)
		@name = name || "#{NAMES.sample} #{APELLIDOS.sample}"
		@positionx = positionx || rand(MAP[0])
		@positiony = positiony || rand(MAP[1])
		@pickup_weapon = false
	end

end