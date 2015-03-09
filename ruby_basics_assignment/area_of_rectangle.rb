def area(length,breadth)
	area=length*breadth
end


begin
puts "enter the length of the rectangle"
length=gets.chomp.to_f
puts "enter the breadth of the rectangle"
breadth=gets.chomp.to_f
area=area(length,breadth)
puts "area of rectangle=#{area}"
end


