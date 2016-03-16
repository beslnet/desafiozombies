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

count = 0 
dead = false


	humans.each do |p|
		count += 1
		puts p.object_id
		p.run
		guns.each do |g|
			
		end
		zombies.each do |q|
			q.walk
			p.danger q 
			dead = p.dead q
			if dead === true
				humans.delete(p)
				puts "#{p.name} ha sido mordido por #{q.name} y se ha transformado en Zombie :-("
				zombies << Zombie.new(p.name)
				puts zombies.length
				puts humans.length
				break
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
		#humans.delete_if {|p| p === p}
		#puts humans.length
		#dead === true ? humans.delete(p) {"not found"} : puts("Sigues vivo!!!")
	end




puts "Comienza el juego!"
puts "Zombies en el mapa: #{zombies.count}"
puts "Personas en el mapa: #{humans.count}"
puts "Perros en el mapa: #{dogs.count}"
