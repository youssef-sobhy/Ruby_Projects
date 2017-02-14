stop_words = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])		                                  # A method that reads the entire file into an array, line by line.
line_count = lines.size 																						# The number of lines in the file.
text = lines.join 																									# String of all lines joined together.

# Count the words, characters, paragraphs and sentences.

character_count = text.size 																				# The number of characters in the string.
character_count_nospaces = text.scan(/[^\s+]/).size									# This method counts all characters except for whitespaces(^\s+) using RegExp.
word_count = text.split.size																				# Splitting the text by whitespaces to get words count.
sentence_count = text.split(/\.|\?|!/).size													# Splitting the text by full stops, question marks and exclamation marks.
paragraph_count = text.split(/\n\n/).size														# Splitting text by double newline.

# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words against all words.

all_words = text.scan(/\w+/)
useful_words = all_words.reject { |word| stop_words.include?(word) }
useful_percentage = ((useful_words.size.to_f / all_words.size.to_f) * 100).to_i

# Summarize the text.

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)											# strip removes all extra whitespaces from the start and end of the string.
sentences_sorted = sentences.sort_by { |sentence| sentence.size}
one_third = sentences_sorted.size / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/}		# selects sentences that include is or are only.

# Give the analysis back to the user.

puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{useful_percentage}% of words are non-fluff(important) words"
puts "Summary:\n\n #{ideal_sentences.join(". ")}"
puts "-- End of analysis."