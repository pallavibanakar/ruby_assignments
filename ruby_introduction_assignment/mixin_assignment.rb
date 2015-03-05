begin
module Calculate
  def percentage(marks_scored,total_marks)
     percent=(marks_scored/total_marks)*100;
     return percent
  end
  def simple_interests(principal,time,rate)
     simple_interest=(principal*time*rate)/100;
     return simple_interest
  end
end


class Score 
include Calculate


end

class Interest 
include Calculate

end 
  
  

  puts "Enter the marks scored"
  marks_scored=gets.chomp.to_f
  puts "Enter the total marks"
  total_marks=gets.chomp.to_f
  calculate_score=Score.new
  percent=calculate_score.percentage(marks_scored,total_marks)
  puts "percentage is"
  puts percent
  puts "Enter principal"
  principal=gets.chomp.to_f
  puts "Enter time period"
  time=gets.chomp.to_f
  puts "Enter rate"
  rate=gets.chomp.to_f
  calculate_interest=Interest.new
  simple_interest=calculate_interest.simple_interests(principal,time,rate)
  puts "simple_interest is:"
  puts simple_interest
end
