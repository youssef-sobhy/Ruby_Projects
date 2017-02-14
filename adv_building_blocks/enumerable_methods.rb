module Enumerable
	def my_each
		for x in self
			yield(x)
		end
	end

	def my_each_with_index
		index = 0
		for x in self
			yield(x, index)
			index += 1
		end
	end

	def my_select
		selected = []
		self.my_each do |x|
			if yield(x) == true
				selected << x
			end
		end
		selected
	end

	def my_all?
		self.my_select {|x| yield(x)} == self ? true : false
	end

	def my_any?
		self.my_select {|x| yield(x)}.length > 0 ? true : false
	end

	def my_none?
		!my_any? {|x| yield(x)}
	end

	def my_count(arg = nil)
		if arg
			self.my_select {|x| x == arg}.length
		elsif block_given?
			self.my_select {|x| yield(x)}.length
		else
			self.length
		end
	end

	def my_map(&proc)
		result = []
		if block_given?
			self.my_each { |x| result << yield(x) }
		else
			self.my_each { |x| result << x.proc.call }
		end
		result
	end

	def my_inject

	end
end




array = [5, 1, 2, 3, 4, 5, 6, 7, 8, 11]

##p array.inject {|x, y| x * y}
##p array.my_inject {|x, y| x * y}

p array.each {|x| x}
p array.my_each {|x| x}

array.each_with_index {|x, index| puts "#{x}'s index is #{index}."}
array.my_each_with_index {|x, index| puts "#{x}'s index is #{index}."}

p array.select {|x| x % 2 == 0}
p array.my_select {|x| x % 2 == 0}

p array.all? {|x| x < 10}
p array.my_all? {|x| x < 10}

p array.any? {|x| x > 10}
p array.my_any? {|x| x > 10}

p array.none? {|x| x > 10}
p array.my_none? {|x| x > 10}

puts array.count
puts array.count(1)
puts array.count {|x| x % 2 == 0}
puts array.my_count
puts array.my_count(1)
puts array.my_count {|x| x % 2 == 0}

my_proc = Proc.new {|x| x * 2}
p array.map {|x| x * 2}
p array.my_map {|x| x * 2}
p array.map(&my_proc)
p array.my_map(&my_proc)
