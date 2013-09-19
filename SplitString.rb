def split_string(file_name)
    puts File.open(file_name, 'r') {|f| f.read().split }
    end
