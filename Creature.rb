require_relative "map.rb"
class Creature

	attr_accessor :name, :positionx, :positiony, :dead

	def initialize(name=nil, positionx=nil, positiony=nil)
		@name = name || "#{NAMES.sample} #{APELLIDOS.sample}"
		@positionx = positionx || rand(MAP[0])
		@positiony = positiony || rand(MAP[1])
	end

end