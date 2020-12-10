require 'byebug'

INPUT = File.readlines('./input.txt').map {|el| el.chomp.split('')}

def solve(dx,dy)
  row, col = [0, 0]
  res = 0
  while row < 323
    res +=1 if INPUT[row][col % 31] == '#'
    row += dy
    col += dx
  end
  res
end

p solve(3,1)
p solve(1,1)*solve(3,1)*solve(5,1)*solve(7,1)*solve(1,2)
