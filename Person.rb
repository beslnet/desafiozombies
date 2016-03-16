require_relative "Creature.rb"
require "pp"

class Person < Creature

	def run
		no_avanzar = 0
		rango = (1..MAP[0]).to_a
		posx = @positionx + rand(-2..2)
		posy = @positiony + rand(-2..2)
		@positionx === posx || @positiony === posy ? detenido = true : ""
		rango.include?(posx) ? @positionx = posx : no_avanzar += 1
		rango.include?(posy) ? @positiony = posy : no_avanzar += 1
		no_avanzar == 2 || detenido === true ? puts("#{@name} no pudo avanzar por ahora, lo hará en un nuevo intento") : puts("#{@name} se está moviendo") 

		#puts "x: #{@positionx} - y: #{@positiony}"

	end

	def danger(zombie)
		cerca_x = @positionx.between?(zombie.positionx - 3, zombie.positionx + 3)
		cerca_y = @positiony.between?(zombie.positiony - 3, zombie.positiony + 3)
		cerca_x === true && cerca_y == true ? puts("Ayuda!!!... El zombie #{zombie.name} está cerca!!"): puts("todo bien por acá!")
		#puts "Coordenadas #{@name} x: #{@positionx} - y: #{@positiony} | Coordenadas #{zombie.name} x:#{zombie.positionx} - y: #{zombie.positiony}"
	end

	def dead(zombie)
		dead_x = @positionx.between?(zombie.positionx - 1, zombie.positionx + 1)
		dead_y = @positiony.between?(zombie.positiony - 1, zombie.positiony + 1)
		dead_x === true && dead_y == true ? @is_dead = true : @is_dead = false
		#puts "Coordenadas #{@name} x: #{@positionx} - y: #{@positiony} | Coordenadas #{zombie.name} x:#{zombie.positionx} - y: #{zombie.positiony}"
	end

	def picks_arm(gun)

	end

	# def zombified(zombie)
	# 	puts "El Zombie #{zombie.name} ha mordido a #{@name}"
	# 	@dead = true
	# 	#return @dead
	# end

	def to_s
		"Es una persona, su nombre es #{@name}, se encuentra en las siguientes coordenadas x: #{@positionx}, y: #{@positiony}"
	end

end

