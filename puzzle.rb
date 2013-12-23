# A person forgot their five digit pin code, but remembers some hints:
# First digit is square of second digit
# Sum of the second and third digits is 10
# Fourth digit is second digit + 1
# Sum of fifth and third digits is 14
# Sum of all digits is 30

class Puzzle

	def correct_pins
		# populate array with 0 -9
		@numbers = *(0..9)
		# Loop a million times
		1000000.times do 
			# choose five random digits
			pins = @numbers.shuffle[0,5]
			total = 0
			pins.each do |pin|
				total = total + pin
			end
			if total == 30

				# First hint (First digit is square of second digit) doesn't yield a result

				# if pins[0] == pins[1] ** 2 && (pins[1] + pins[2] == 10) && (pins[3] == (pins[1] + 1)) && (pins[4] + pins[2] == 14)
				# 	@correct_pin = pins
				# end
				if (pins[1] + pins[2] == 10) && (pins[3] == (pins[1] + 1)) && (pins[4] + pins[2] == 14)
					@correct_pin = pins
				end
			end
		end
		puts @correct_pin
	end
end

p = Puzzle.new
p.correct_pins

