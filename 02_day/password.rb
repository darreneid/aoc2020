require 'byebug'

INPUT = File.readlines('input.txt').map {|el| el.chomp}

def solve
  res = 0

  INPUT.each do |el|
    bounds, char, pw = el.split(' ')
    lower, upper = bounds.split('-').map {|el| el.to_i}
    char = char[0...-1]
    res +=1 if (pw[lower-1] == char) ^ (pw[upper-1] == char)
  end

  res
end

p solve