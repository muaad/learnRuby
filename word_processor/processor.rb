
def get_file(file)
  File.open(file).read()
end

txt_from_file = get_file("sample.txt")

def get_character_count(text)
  puts character_count = text.length
end

print "The character count is: "; get_character_count(txt_from_file)



def get_word_count(text)
  word_count = text.split(" ").length
end

print "The word count is: "; get_word_count(txt_from_file)

def get_paragraph_count(text)
  paragraph_count = text.split("\n\n").length
end

print "The paragraph count is: "; get_paragraph_count(txt_from_file)

def get_sentence_count(text)
  sentence_count = text.split(".").length
end

print "The sentence count is: "; get_sentence_count(txt_from_file)

def get_character_count_without_spaces(text)
  puts character_count_without_spaces = text.delete(' ').length
end

print "The character count without spaces is: "; get_character_count_without_spaces(txt_from_file)

def get_line_count(file)
  #puts text.lines.count
  %x{wc -l < "#{file}"}.to_i
end

print "The line count is: ";puts get_line_count("sample.txt")

def  average_words_per_sentence(text)
  puts get_word_count(text) / get_sentence_count(text)
end

print "Average words per sentence is: "; average_words_per_sentence(txt_from_file)

def  average_sentences_per_paragraph(text)
  puts get_sentence_count(text) / get_paragraph_count(text)
end

print "Average sentences per paragraph is: ";average_sentences_per_paragraph(txt_from_file)

def  percentage_of_useful_words(text)
  useful_words = (text.scan("that").count +  text.scan("or").count + text.scan("are").count).to_f
  word_count = get_word_count(text).to_f
  percentage = (useful_words / word_count) * 100
end

puts "Percentage of useful words is: %.2f" %percentage_of_useful_words(txt_from_file.downcase)


