class Board

	# INDEX

	# ||=======================||
	# ||   0   |   1   |   2   ||
	# ||=======================||
	# ||   3   |   4   |   5   ||
	# ||=======================||
	# ||   6   |   7   |   8   ||
	# ||=======================||


	WIN_CASES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

	def initialize
		@board = Array.new(9, ' ')
	end

	def display
		puts %(

		 Use numbers from 1 to 9.

		||=======================||
		||   #{@board[0..2].join(' 	 |   ')}   ||
		||=======================||
		||   #{@board[3..5].join(' 	 |   ')}   ||
		||=======================||
		||   #{@board[6..8].join(' 	 |   ')}   ||
		||=======================||

		)
	end

	def win_or_tie?
		return true if win?('X') || win?('O')
		return 'tie?' if @board.none? { |cell| cell == ' '}
	end

	def win?(piece)
		WIN_CASES.any? do |combo|
			combo.all? { |i| @board[i] == piece}
		end
	end

	def spot(piece, cell)
		if cell < 0 || cell > 8
			puts "\nUse numbers from 1 to 9 only!"
		elsif @board[cell] != ' '
			puts "\nDamn boy!, that spot is taken yo!"
		else
			@board[cell] = piece
		end
	end
end