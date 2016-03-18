require_relative "Person.rb"
require_relative "Zombie.rb"
require_relative "Dog.rb"
require_relative "Gun.rb"
require "pp"

zombies = []
humans = []
dogs = []
guns = []

50.times do |n|
	zombies << Zombie.new
end

20.times do |n|
	humans << Person.new
end

1.times do |n|
	dogs << Dog.new("Perro-#{n}")
end

60.times do |n|
	guns << Gun.new("#{WEAPON.sample}")
end


dead = false

while humans.count > 0 && zombies.count > 0

	humans.each do |p|
		p.run
		guns.each do |g|
			p.pick_up g
			if p.pickup_weapon === true
				guns.delete(g)
				break
			end
		end
		zombies.each do |q|
			q.walk
			p.danger q
			p.dead q
			if p.zombie_dead == true
				zombies.delete(q)
				puts "#{p.name} ha matado al zombie #{q.name} yeah lmL"
			else
				if p.is_dead === true
					humans.delete(p)
					puts "#{p.name} ha sido mordido por #{q.name} y se ha transformado en Zombie :-("
					if p.pickup_weapon === true
						guns << Gun.new("#{WEAPON.sample}", p.positionx, p.positiony)
					end
					zombies << Zombie.new(p.name)
					break
				end
			end
				dogs.each do |r|
					r.run
					r.attack q
					dead = r.attack q
					if dead === true
						zombies.delete(q)
						puts "Tenemos un Zombie menos: #{q.name}, lo ha matado un perro!"
					end
				end
		end
	end
end




puts "Resumen final del juego:"
puts "Zombies en el mapa: #{zombies.count}"
puts "Personas en el mapa: #{humans.count}"
puts "Perros en el mapa: #{dogs.count}"
puts "Armas en el mapa: #{guns.count}"