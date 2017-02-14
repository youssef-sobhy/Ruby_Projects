def substrings(string, dictionary)
	string.downcase!
	result = Hash.new

	dictionary.each do |substring|
		if string.include? (substring)
			result[substring] = string.scan(substring).length
		end
	end
	puts result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)