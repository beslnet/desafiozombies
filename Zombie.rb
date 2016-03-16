require_relative "Creature.rb"
# ==> true

class Zombie < Creature

	def walk
		no_avanzar = 0
		arreglo = (1..MAP[0]).to_a
		posx = @positionx + rand(-2..2)
		posy = @positiony + rand(-2..2)
		@positionx === posx || @positiony === posy ? detenido = true : ""
		arreglo.include?(posx) ? @positionx = posx : no_avanzar += 1
		arreglo.include?(posy) ? @positiony = posy : no_avanzar += 1
		no_avanzar == 2 || detenido == true ? puts("El Zombie #{@name} no pudo avanzar por ahora, lo hará en un nuevo intento") : puts("El Zombie #{@name} se está moviendo") 
	end

	def to_s
		"Es un zombie y en vida su nombre era: #{@name}, actualmente se encuentra en las siguientes coordenadas x: #{@positionx}, y: #{@positiony}"
	end

end
# ==> :to_s
