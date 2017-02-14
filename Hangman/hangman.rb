require 'yaml'

class Hangman
	def initialize
	  @secret_word = random_word.split('')
	  @wrong_guess = 0
	  @max_guesses = 10
	  @wrong_letters = []
	  @output = Array.new(@secret_word.size, '_')
	end

	def start
		puts "\nWelcome to Hangman!\n\n"
	  puts "What would you like to do?\n\n1. Start a new game.\n2. Load a saved game.\n\n"
	  input = gets.chomp.to_i

	  case input
	  when 1
	  	play
	  when 2
	  	load_game
	  end
	end

	def play
		puts "\n#{@output.join(' ')}"
		puts "\nGuess the word letter by letter, remember you have 10 guesses only.\n\n"
		while true
			@input = gets.chomp.upcase
			char_validation
			win_or_lose?
		end
	end

	def save_game
		Dir.mkdir('saved_games') unless Dir.exist? 'saved_games'
		filename = "saved_games/save.yaml"
		File.open(filename, 'w+') { |file| file.puts(YAML.dump(self)) }
		puts "\nGame successfully saved!"
		exit
	end

	def load_game
		YAML.load_file('saved_games/save.yaml').play
	end

	def random_word
		legit_words = []
		File.readlines('dictionary.txt').each do |line|
			legit_words << line if line.size.between?(5, 12)
		end
		legit_words.sample.upcase.strip
	end

	def char_validation
		if @wrong_letters.include?(@input) || @output.include?(@input)
			puts "\nYou've already tried this letter! Try again.\n\n"
			puts "\n#{@output.join(' ')}\n\n"
		elsif @input =~ /[^A-Z]/ || @input.empty?
			puts "\nSorry, I only accept letters.\n\n"
			puts "\n#{@output.join(' ')}\n\n"
		elsif @input == 'SAVE'
			save_game
		elsif @secret_word.include?(@input)
			right_guess
		else
			wrong_guess
		end
	end

	def right_guess
		@secret_word.each_with_index do |letter, index|
			@output[index] = letter if letter == @input
		end
		puts "\n#{@output.join(' ')}\n\n"
	end

	def wrong_guess
		@wrong_guess += 1
		@wrong_letters << @input
		wrong = "\nWrong!, You have #{@max_guesses - @wrong_guess} guesses left and the letter/s you have guessed is/are #{@wrong_letters.join(', ')}"
		puts wrong if @wrong_guess < 10
		puts "\n#{@output.join(' ')}\n\n"
	end

	def win_or_lose?
		if @output == @secret_word
			puts "\nYou won!"
			exit
		elsif @wrong_guess == 10
			puts "\nYou lost!, the word is #{@secret_word.join('')}"
			exit
		end
	end
end

Hangman.new.start