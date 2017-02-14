print "What do you wanna encrypt? "
string = gets.chomp

print "What is your number? "
number = gets.chomp.to_i

def caesar_cipher(string, number)
	string.gsub(/[A-Za-z]/) do |letter|
		if letter.ord.between?('A'.ord, 'Z'.ord)
			x = letter.ord + number
			x -= 26 if x > 'Z'.ord    
			letter = x.chr
		else
			x = letter.ord + number
			x -= 26 if x > 'z'.ord
			letter = x.chr
		end
	end
end

puts caesar_cipher(string, number)