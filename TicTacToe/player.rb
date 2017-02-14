class Player
	attr_reader :name, :piece
	@@player_number = 0

	def initialize
		@@player_number += 1
		print "Enter player #{@@player_number}'s name: "
		@name = gets.chomp.capitalize
		@piece = @@player_number.odd? ? 'X' : 'O'
	end
end