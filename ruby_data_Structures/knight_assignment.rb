

def can_proceed(x,y,solution)
  if x>=0 and x<8 and y>=0 and y<8 and solution[x][y]==-1
    return true
  else
    return false
  end
end


def print_solution(solution)
  for x in 0..7
    for y in 0..7
      puts "#{solution[x][y]}"
    end
  end
end


def knight_solution()
  solution=Array.new(8){Array.new(8,-1)}
 
  x_Move=[2,1,-1,-2,-2,-1,1,2]
  y_Move=[1,2,2,1,-1,-2,-2,-1]
  puts "enter the inital x position"
  x_current=gets.chomp.to_i
  puts "enter the inital y position"
  y_current=gets.chomp.to_i
  solution[x_current][y_current]=0
  
  if(kt_recursive(x_current,y_current,1,solution,x_Move,y_Move) == false)
    puts "solution doesnt exist"
    
  return false
  else
    print_solution(solution)
  end
  return true;
end


def kt_recursive(x_current,y_current,move_count,solution,x_Move,y_Move)
  if move_count== 8*8
    return true
  end
  for k in 0..7
    x_next_move=x_current+x_Move[k]
    y_next_move=y_current+y_Move[k]
		
    if can_proceed(x_next_move,y_next_move,solution)
      solution[x_next_move][y_next_move]=move_count
      if kt_recursive(x_next_move,y_next_move,move_count+1,solution,x_Move,y_Move)==true
	return true
      else
        solution[x_next_move][y_next_move]=-1
      end
    end
  end
  return false
end

begin
  knight_solution()
end


