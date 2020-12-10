require 'byebug'

INPUT = [0] + File.readlines('./input.txt').map {|el| el.chomp.to_i}.sort + [168]
MEMO = Hash.new

def part_one
  h = Hash.new(0)

  INPUT.each_with_index do |el, i|
    next if i == 0
    prev = INPUT[i-1]
    h[el - prev] += 1
  end

  h[1]*h[3]
end

def generate_path
  num_next = Hash.new {|h, k| h[k] = []}

  (0...INPUT.length).reverse_each do |i|
    break if i == 0
    
    el = INPUT[i]
    j = i - 1

    while INPUT[j] >= el - 3 && j >= 0
      num_next[el] << INPUT[j]
      j -= 1
    end
  end
  
  num_next
end

def num_paths(target, path)
  return 1 if target == 0
  return MEMO[target] unless MEMO[target].nil?

  num = 0
  path[target].each do |el|
    num += num_paths(el, path)
  end
  MEMO[target] = num
  num
end

def part_two
  path = generate_path
  num_paths(168, path)
end


# p part_one

p part_two