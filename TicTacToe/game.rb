require './player'
require './board'

class TicTacToe
	def initialize
		@board = Board.new
		@players = [Player.new, Player.new]
		@turn = 0
		puts "#{@players[0].name} is X and #{@players[1].name} is O."
	end

	def play
		@board.display
		user_input
	end

	def user_input
		while true

			@name = @players[@turn].name
			@piece = @players[@turn].piece

			print "\n#{@name}'s turn, where do you wanna put your #{@piece}? \n\n"
			if @board.spot(@piece, gets.chomp.to_i - 1)
				 @board.display

				 case @board.win_or_tie?
				 when nil
				 	@turn = @turn == 0 ? 1 : 0
				 when 'tie?'
				 	puts "holy shit! it's a tie :O"
				 else
				 	puts "#{@name} has won :D"
				 	break
				 end
			end
		end
	end

end


new_game = TicTacToe.new
new_game.play