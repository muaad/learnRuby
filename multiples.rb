def multiples_of_three(range)
  range.to_a.select{|n| n % 3 == 0}
end

def multiples_of_three_and_five(range)
  range.to_a.select{|n| (n % 3 == 0 || n % 5 == 0) && n != 0}
end
puts multiples_of_three_and_five(0..20)
