def multiples_of_three(range)
  range.to_a.select{|n| n % 3 == 0}
end

def multiples_of_three_and_five(range)
  begin_time = Time.now  
  x = []
  range.to_a.each do|n|
    if (n % 3 == 0 || n % 5 == 0) && n != 0
      x.push(n)
    end
  end
  puts x.inject(0) { |result, element| result + element }
  puts "Muaad", time = Time.now - begin_time
end

def sum_multipes(range)
  begin_time = Time.now
  range.to_a.select{|n| n % 3 == 0}.inject(0) { |result, element| result + element }
  puts "Martha", time = Time.now - begin_time
end

puts multiples_of_three_and_five(0..100)
puts sum_multipes(0..100)



