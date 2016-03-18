require_relative "Creature.rb"
require "pp"

class Dog < Creature
	def run
		no_avanzar = 0
		rango = (1..MAP[0]).to_a
		posx = @positionx + rand(-2..2)
		posy = @positiony + rand(-2..2)
		@positionx === posx || @positiony === posy ? detenido = true : ""
		rango.include?(posx) ? @positionx = posx : no_avanzar += 1
		rango.include?(posy) ? @positiony = posy : no_avanzar += 1
		no_avanzar == 2 || detenido === true ? puts("#{@name} no pudo avanzar por ahora, lo hará en un nuevo intento") : puts("#{@name} se está moviendo") 
	end

	def attack(zombie)
		cerca_x = @positionx.between?(zombie.positionx - 3, zombie.positionx + 3)
		cerca_y = @positiony.between?(zombie.positiony - 3, zombie.positiony + 3)
		cerca_x === true && cerca_y == true ? @is_dead = true: puts("Perro cerca de un Zombie: Grrrrrrr wofff wofff!!!")
	end
end