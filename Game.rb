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

10.times do |n|
	humans << Person.new
end

5.times do |n|
	dogs << Dog.new("Perro-#{n}")
end

10.times do |n|
	guns << Gun.new("#{WEAPON.sample}")
end


count = 0 
dead = false

while humans.count > 0 && zombies.count > 0

	humans.each do |p|
		count += 1
		puts p.object_id
		p.run
		guns.each do |g|
			p.pick_up g
			if p.pickup_weapon === true
				guns.delete(g)
			end
		end
		zombies.each do |q|
			q.walk
			p.danger q
			dead = p.dead q
			if p.zombie_dead == true
				zombies.delete(q)
				puts "#{p.name} ha matado al zombie #{q.name} yeah lmL"
			else

				if dead === true
					humans.delete(p)
					puts "#{p.name} ha sido mordido por #{q.name} y se ha transformado en Zombie :-("
					if p.pickup_weapon === true
						guns << Guns.new("#{WEAPON.sample}", p.positionx, p.positiony)
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




puts "Comienza el juego!"
puts "Zombies en el mapa: #{zombies.count}"
puts "Personas en el mapa: #{humans.count}"
puts "Perros en el mapa: #{dogs.count}"
puts "Armas en el mapa: #{guns.count}"