def end_string
  puts "enter the string or sentence"
  sentence=gets.chomp
  if sentence=~ /art$/
   puts "yes it ends with art"
  else
   puts "no it doesnt end with art"
  end
end

end_string
