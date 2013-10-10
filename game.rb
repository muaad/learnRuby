def scrabble
	# _0points = {' '=>2} 
	_1points = {"E"=>12, "A"=>9, "I"=>9, "O"=>8, "N"=>6, "R"=>6, "T"=>6, "L"=>4, "S"=>4, "U"=>4}
	_2points = {"D"=>4, "G"=>3}
	_3points = {"B"=>2, "C"=>2, "M"=>2, "P"=>2}
	_4points = {"F"=>2, "H"=>2, "V"=>2, "W"=>2, "Y"=>2}
	_5points = {"K"=>1}
	_8points = {"J"=>1, "X"=>1}
	_10points = {"Q"=>1, "Z"=>1}

	# _chars = _0points + _1points + _2points + _3points + _4points + _5points + _8points + _10points
	# array_of_hashes = [_0points, _1points, _2points, _3points, _4points, _5points, _8points, _10points]
	@array_of_hashes = [_1points, _2points, _3points, _4points, _5points, _8points, _10points]
  @letters_and_values = {_1points => 1, _2points => 2, _3points => 3, _4points => 4, _5points => 5, _8points => 8, _10points => 10}
	# Hash[*array_of_hashes.collect{|hash| hash.collect{|key,value|[key,value].flatten}.flatten}.flatten]
	@motherhash = @array_of_hashes.inject(:merge)
	# puts @motherhash

	#h = { "a" => 100, "b" => 200 }
	#h.each {|key, value| puts "#{key} is #{value}" }

	@bag = []
	@motherhash.each do |char, countt|

		i = 0
		while i < countt
			@bag << char
			i += 1
		end

	end
	# puts @bag

	# @motherhash = {" "=>2, "E"=>12, "A"=>9, "I"=>9, "O"=>8, "N"=>6, "R"=>6, "T"=>6, "L"=>4, "S"=>4, "U"=>4, "D"=>4, "G"=>3, "B"=>2, "C"=>2, "M"=>2, "P"=>2, "F"=>2, "H"=>2, "V"=>2, "W"=>2, "Y"=>2, "K"=>1, "J"=>1, "X"=>1, "Q"=>1, "Z"=>1}


	puts "Welcome to Scrabble..."
	@games_left = @bag.length
	@score = 0
	@letter_val = 0
	@rack = ''

	def calc(word)
		letters = word.split("")
		word_val = 0
		# puts letters
		letters.each do |letter|
			if @rack.include? (letter.upcase) #also  if @rack.index(letter.upcase).class == Fixnum
				puts letter + " is in your rack..."
			else
				puts "Oops, you do not have \"" + letter + "\" in your rack!"
				init #solve chicken & egg problem, which method comes first...
			end
		end
		
		#all letters are in the rack
		letters.each do |letter|
			@bag.delete_at(@bag.index(letter.upcase)) #remove the tiles from the bag
			@rack.sub!(letter.upcase , '') #remove the tiles from the rack
      @array_of_hashes.each do |hash|
        letter = letter.upcase
        if hash.include? letter
          @letter_val = @letters_and_values[hash]
          puts "The score for #{letter} is #{@letter_val}"
			    word_val += @letter_val.to_i
        end
      end
			#@letter_val = @motherhash[letter.upcase]
		end
		@games_left = @games_left - letters.count #removing used chars from the bag
		@score += word_val
		puts "Cool! \"" + word +"\" scores " + word_val.to_s + ". Your current score is "+ @score.to_s

	end

	def wordcheck?(word, dictionary)

		dict = File.open(dictionary)
		di = File.read(dict)

		if di.include?(word)
			# word exists, check if chars remain in bag
			calc(word)  
		else 
			# doesnt exist
			puts "Oops! \'" + word + "\' doesnt exist in the English dictionary." 
			# doesnt_exist(word) 
		end 

	end


	def init
		@games_left.times do
			puts @games_left.to_s + " tiles in the bag. Your current score is "+ @score.to_s 

			(7-@rack.length).times do
				@rack += @bag[rand(@bag.length)] #adding 7 tiles to your rack
			end

			print "Enter an English word using \"" + @rack + "\":"

			# get user input for word...
			word = gets.chomp

			# check if word is in dict...
			wordcheck?(word, "/usr/share/dict/words")
		end
	end
	

	init
	"Congrats, you used up all the items in the bag! Wow!"

end
scrabble


#take care of blanks usage


