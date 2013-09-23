user = ARGV.first
prompt = '> '
puts "Hi #{user}, I'm the #{$0} script." #$0 is a special variable that refers to the script itself
puts "I'd like to ask you a few questions."
puts "Do you like me #{user}?"
print prompt
likes = STDIN.gets.chomp() #Without STDN, value from ARGV is treated as a file
puts "Where do you live #{user}?"
print prompt
lives = STDIN.gets.chomp()
puts "What kind of computer do you have?"
print prompt
computer = STDIN.gets.chomp()
puts <<PARAGRAPH
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer} computer. Nice.
PARAGRAPH

