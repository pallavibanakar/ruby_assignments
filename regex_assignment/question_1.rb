 def parse
   flag=0
   flag_inside_class=0
   class_variable=0
   instance_variable=0
   class_count=Array.new
   local_count=Array.new
   global_count=Array.new 
   instance_count=Array.new
   array=Array.new
   puts "enter the filepath you want to parse"
   file_name=gets.chomp
   if file_name=~ /.rb$/
     puts "Yes it a ruby file!!"
     flag=1
   else
     puts "Its not a ruby file please enter the path for ruby file"
   end
   if(flag==1)
     words = File.open(file_name,'r'){ |f|  f.read.split } 
     words.each do |word|
         if word.match(/class/)
          array.push(word) 
          flag_inside_class=1

         elsif word.match(/def/)
           array.push(word)
         
         elsif word.match(/end/)
            array.pop
         end
         unless array.length==0
           if word.match(/^@@/)
              if class_count.include? word
                next
              else
                class_count << word
              end
           elsif word.match(/^@/)
               if instance_count.include? word
                 next
               else
                 instance_count << word
               end
                    
          end
        
         end
         if array.length==0 and flag_inside_class==1
           class_variable=class_variable+class_count.length.to_i
	   instance_variable=instance_variable+instance_count.length.to_i
           class_count.clear
           instance_count.clear
         end
         
         if word.match(/^\$/)
                if global_count.include? word
                 next
                else
                  global_count << word
                end
         end
        
  
     end    
   end
   puts "class_variable= #{class_variable}"
   puts "instance_variable= #{instance_variable}"
   puts "global= #{global_count.length}"
 end

 parse
