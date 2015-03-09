def string_methods()
 	main_string=String.new("hello\n")
        puts main_string
        puts "string modifications"
 	main_string=main_string.chomp
        puts "string after chomp method= #{main_string}"
 	main_string=main_string.capitalize
 	puts "string after capitalization= #{main_string}"
 	main_string=main_string.downcase
 	puts "string after downcase = #{main_string}"
 	main_string=main_string.concat("world")
 	puts "string after concatinating world = #{main_string}"
 	main_string=main_string.delete "l"
 	puts "string after deleting letter 'l' = #{main_string}"
        main_string=main_string.reverse
        puts "reverse of string = #{main_string}"
        puts "-------------------------------"
end

def hash_methods()
       
 	main_hash = { "d" => 100, "b" => 200 }
        puts main_hash
        puts "hash modifications"
 	other_hash = {"c" => 300, "a"=> 400 }
 	main_hash=main_hash.merge(other_hash)
        puts "hash after merge= #{main_hash}"
        inverse_hash=main_hash.invert
        puts "hash after inverse= #{inverse_hash}"
        main_hash.replace({ "c" => 300, "d" => 400 })
 	puts "hash after replace #{main_hash}"
 	main_hash.delete("d")
 	puts "hash after deleting 'd' #{main_hash}"
        main_hash.clear
        puts "hash after clearing #{main_hash}"
        puts "-----------------------------------"
 	
end

def array_methods()
 	puts "array modifications"
 	main_array=["pallavi",nil, "monica",nil,"pavan"]
 	puts "#{main_array}"
 	main_array.concat(["apoorva","vibha"])
 	puts "array after contact = #{main_array}"
 	main_array=main_array.compact
 	puts "array after compact = #{main_array}"
 	main_array.insert(2,"monica")
	puts "array after insertion = #{main_array}"
	main_array.delete_at(2)
 	puts "array with 2nd element deleted= #{main_array}"
        main_reverse=main_array.reverse
        puts "reverse of array= #{main_reverse}"
end

begin
	string_methods()
	hash_methods()
	array_methods()
end

 


 

