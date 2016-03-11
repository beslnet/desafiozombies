require_relative "Creature.rb"
# ==> true

class Zombie < Creature

	def walk
		no_avanzar = 0
		puts "#{@positionx}, #{@positiony}"
		arreglo = (0..MAP[0]).to_a
		randomx = rand(-1..1)
		randomy = rand(-1..1)
		arreglo.include?(@positionx + randomx) ? @positionx += randomx : no_avanzar += 1
		arreglo.include?(@positiony + randomy) ? @positiony += randomy : no_avanzar += 1
		no_avanzar == 2 ? puts("No puedes avanzar por ahora, intenta nuevamente") : puts("Arrancando !!, todo bien por acá!") 
		puts "#{@positionx}, #{@positiony}"
	end

	def speak

	end

	def to_s

	end

end
# ==> :to_s

prueba = Zombie.new
# ==> #<Zombie:0x00000001380738 @name="Peter", @positionx=20, @positiony=0>

prueba.walk
# =20, 0
# =Arrancando !!, todo bien por acá!
# =19, 1
# ==> nil
prueba.walk
# =19, 1
# =Arrancando !!, todo bien por acá!
# =18, 0
# ==> nil
prueba.walk
# =18, 0
# =Arrancando !!, todo bien por acá!
# =17, 0
# ==> nil
prueba.walk
# =17, 0
# =Arrancando !!, todo bien por acá!
# =18, 0
# ==> nil
prueba.walk
# =18, 0
# =Arrancando !!, todo bien por acá!
# =19, 0
# ==> nil
prueba.walk
# =19, 0
# =Arrancando !!, todo bien por acá!
# =19, 1
# ==> nil
prueba.walk
# =19, 1
# =Arrancando !!, todo bien por acá!
# =20, 0
# ==> nil
prueba.walk
# =20, 0
# =Arrancando !!, todo bien por acá!
# =20, 1
# ==> nil
