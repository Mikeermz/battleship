require "pp"

require_relative "Grid.rb"
require_relative "Boat.rb"
require_relative "Part.rb"
require_relative "Bomba.rb"

$fin = false
$vidas = 1


#Inicializa juego 
grid_enemigo =  Grid.new

b = Boat.new("Carrier", 5)
b.parts << Part.new(1,0)
b.parts << Part.new(1,1)
b.parts << Part.new(1,2)
b.parts << Part.new(1,3)
b.parts << Part.new(1,4)

b = Boat.new("Battleship", 4)
b.parts << Part.new(3,3)
b.parts << Part.new(3,4)
b.parts << Part.new(3,5)
b.parts << Part.new(3,6)

b = Boat.new("Cruiser", 3)
b.parts << Part.new(2,7)
b.parts << Part.new(3,7)
b.parts << Part.new(4,7)
b.parts << Part.new(5,7)

b = Boat.new("Submarine", 3)
b.parts << Part.new(6,2)
b.parts << Part.new(5,2)
b.parts << Part.new(4,2)

b = Boat.new("Destroyer", 2)
b.parts << Part.new(5,0)
b.parts << Part.new(5,1)

Bomba.new(0,0)

grid_enemigo.posiciona(Boat.all, "Boat")
grid_enemigo.posiciona(Bomba.all, "Bomba")



while (!$fin)
	puts "Teclee 'a' para atacat, Teclee 'm' para ver el mapa, 'b' para ver barcos sobrevivientes, 'q' para salir"
	input = gets.chomp

	case input
	when "a"
		puts "Teclea coordenada 'x', seguidaca por coordenada 'y' (0-7)"
		x = gets.chomp.to_i
		y = gets.chomp.to_i
		puts "Has atacado a (#{x},#{y})!"
		grid_enemigo.ataca(x,y)
	when "b"
		boats = Boat.boats_left
		boats.each do |b|
			puts b.type
		end
	when "m"
		pp grid_enemigo
	when "q"
		puts "Fin del juego"
		$fin = true
	else
		puts "Error de entrada"
		
	end
	
end