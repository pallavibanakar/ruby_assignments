begin

   def arithmetic_operation(first_number,second_number,operator)
      first_number.send(operator,second_number)	
   end



   puts "enter the first number"
   first_number=gets.chomp.to_i
   puts "enter the second number"
   second_number=gets.chomp.to_i
   puts "enter the operator"
   operator=gets.chomp
   result=arithmetic_operation(first_number,second_number,operator)
   puts "result:"
   puts result
       
end

