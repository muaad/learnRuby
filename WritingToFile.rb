def write_to_file(file_name, content, action)
   quote = "\'"
   File.open(file_name, quote + action + quote) {|f| f.write(content) }
   end
puts "Enter the file name:"
file_name = gets.chomp
puts "Enter the file contents:"
content = gets.chomp
puts "Type \'w\' if you want to create a new file or \'a\' if you want to append content to an existing file:"
action = gets.chomp

write_to_file(file_name, content, action)


