  def reduce(string)
    count=0
    while string.length!=1
	for i in 1..string.length
           if (i+1)%2==0 && count==0
 	      string.slice!(i)
              puts "#{string}"
              count=1
              break
            end
            if (i)%2==0 && count==1
              string.slice!(i)
              puts "#{string}"
              count=0
              break
           end
        
        end
    end
  end



  puts "please enter the line"
  string=gets.chomp
  array=string.split("")
  reduce(array)
