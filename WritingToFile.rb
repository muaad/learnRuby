def write_to_file(file_name, content, action)
   File.open(file_name, action) {|f| f.write(content) }
   end

