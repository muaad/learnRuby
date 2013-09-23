file_name = "new_file"
name = "martha"

def read_file(file_name)
  File.open(file_name, 'r') do |f| 
		f.read()
	end
end

def	split_file(file_name)
	file_words = read_file(file_name).split(" ")
end

def pick_every_two(array)
	x = []
	array.each do |a|
		if array.index(a) % 2 == 1
			x.push(a)
		end
	end
	puts x
end

def second_pick_every_two(array)
	array.select do |a|
		array.index(a) % 2 == 1
	end
end

puts second_pick_every_two(split_file(file_name))


