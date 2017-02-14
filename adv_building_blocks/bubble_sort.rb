def bubble_sort(array)
	array.length.times do
		array.each_with_index do |number, index|
			result = array[index] <=> array[index+1]
			array[index], array[index+1] = array[index+1], array[index] if result == 1
		end
	end
		puts "#{array}"
end

bubble_sort([4,3,78,2,0,2,5,15,25,33,44,99,102])



def bubble_sort_by(array)
	sorted = false
	while sorted == false
		swapped = false
		(array.length - 1).times do |x|
			if yield(array[x], array[x + 1]) > 0
				array[x], array[x + 1] = array[x + 1], array[x]	
				swapped = true
			end
		end
		sorted = true if swapped == false
	end
	puts "#{array}"
end

bubble_sort_by(["hi", "hello", "hey", "hallaaaaaa", "h"]) {|left, right| left.length - right.length}