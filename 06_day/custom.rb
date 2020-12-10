require 'byebug'
INPUT = File.readlines('./input.txt').map {|el| el.chomp}

def solve
  group = Hash.new(0)
  size = 0
  res = 0

  INPUT.each do |el|
    if el == ""
      group.each do |k, v|
        res += 1 if v == size
      end
      group = Hash.new(0)
      size = 0
    else
      size += 1
      el.each_char {|el| group[el] += 1}
    end
  end
  
  res
end

p solve

