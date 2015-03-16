def ss_pattern
  string="Mississippi"
  if string.scan(/ss/)
    puts "yes pattern ss exist in Mississippi"
  else
    puts "no it doesnt exist"
  end
end

ss_pattern
