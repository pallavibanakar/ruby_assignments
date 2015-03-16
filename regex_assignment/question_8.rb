  def indentify_whitespace
    puts "enter the string"
	string=gets.chomp
	if string=~ /\s/
	  puts "yes there are whitespaces "
	else
	  puts "No there are no whitespaces"
	end
  end
  
  indentify_whitespace