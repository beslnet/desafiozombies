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
	end

	def danger(zombie)
		cerca_x = @positionx.between?(zombie.positionx - 3, zombie.positionx + 3)
		cerca_y = @positiony.between?(zombie.positiony - 3, zombie.positiony + 3)
		cerca_x === true && cerca_y == true ? puts("#{@name} dice: Ayuda!!!... El zombie #{zombie.name} está cerca!!"): puts("todo bien por acá!")
	end

	def dead(zombie)
		dead_x = @positionx.between?(zombie.positionx - 1, zombie.positionx + 1)
		dead_y = @positiony.between?(zombie.positiony - 1, zombie.positiony + 1)
		if dead_x === true && dead_y === true
			puts "El Zombie #{zombie.name} viene a atacar al humano #{@name}!!!"
			if @pickup_weapon === true
				3.times do |n|
					disparo = rand(0..1)
					if disparo === 1
						@zombie_dead = true
						@is_dead = false
						puts "HeadShot!!!...Muere Zombieeee!!!!"
						break
					else
						@zombie_dead = false
						puts "Noooo... no le dí!, me quedan #{3 - (n+1)} intentos!"
						@is_dead = true
					end
				end
			else			
				@is_dead = true
				puts "#{@name} está desarmad@...."
			end
		else
			@zombie_dead = false
			@is_dead = false
		end
	end

	def pick_up(weapon)
		on_x = @positionx.between?(weapon.positionx, weapon.positionx)
		on_y = @positiony.between?(weapon.positiony, weapon.positiony)
		if @pickup_weapon === false
			if on_x === true && on_y === true 
				picked_weapon?
				puts "#{@name} ha cogido el arma #{weapon.name}"
			end
		end
	end

	def picked_weapon?
		@pickup_weapon = true
		return @pickup_weapon
	end

	def to_s
		"Es una persona, su nombre es #{@name}, se encuentra en las siguientes coordenadas x: #{@positionx}, y: #{@positiony}"
	end

end

