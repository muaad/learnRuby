require 'open-uri'
def write_to_file(file_name, content, action)
   File.open(file_name, action) {|f| f.write(content) }
end
open("http://ruby.learncodethehardway.org/book/ex12.html") do |f|
  f.each_line {|line| write_to_file("LCTHW", line, 'a')}
  #puts f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
  #puts f.content_type     # "text/html"
  #puts f.charset          # "iso-8859-1"
  #puts f.content_encoding # []
  #puts f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
end




