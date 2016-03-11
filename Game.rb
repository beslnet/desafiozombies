require_relative "Person.rb"
# ==> true
require_relative "Zombie.rb"
# ==> true



prueba = Zombie.new
# ==> #<Zombie:0x000000008941a8 @name="Franana", @positionx=9, @positiony=0>

prueba.walk
# ==> "#mi nombre es Franana y mi posición es: 9, 0"
