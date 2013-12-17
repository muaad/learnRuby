require 'date'
class Birthday
	def today
		today = Date.new(Time.now.year, Time.now.month, Time.now.day)
	end

	def bday
		Date.new(@year.to_i, @month.to_i, @day.to_i)
	end

	def had_bday_this_year?
		bday.month < today.month or 
        (bday.month <= today.month and bday.day < today.day)
	end

	def calculate_age(bday, today)
		if had_bday_this_year?
			age = today.year - bday.year
		else
			age = (today.year - bday.year) - 1
		end
		age
	end

	def prompt
		puts "When were you born?"
		puts "==================="
		n = 1
		3.times do 
			if n == 1
				print "Year > "
				@year = gets.chomp
			elsif n == 2
				print "Month > "
				@month = gets.chomp	
			else
				print "Day > "
				@day = gets.chomp
			end
			n = n + 1
		end
	end

	def print_em
		puts "===================="
		puts "You are #{calculate_age(bday, today)} years old."
		puts "===================="
	end

	def spank
		n = 1
		calculate_age(bday, today).times do
			puts "Year #{n} > SPANK"
			n = n + 1
		end
	end

end

bd = Birthday.new
bd.prompt
bd.print_em
bd.spank