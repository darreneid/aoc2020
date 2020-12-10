INPUT = File.readlines('./input.txt').map {|el| el.chomp.to_i}
TARGET = 23278925

def part_one
  preamble = INPUT[0..24]
  (25...INPUT.length).each do |i|
    preamble = INPUT[i-25...i]
    return INPUT[i] unless two_sum(preamble, INPUT[i])
  end
end

def part_two
  lower = 0
  upper = 0

  while true
    current_range = INPUT[lower..upper]
    current_sum = current_range.inject(&:+)
    return current_range.max + current_range.min if current_sum == TARGET

    upper +=1 if current_sum < TARGET
    lower +=1 if current_sum > TARGET
  end
end

def two_sum(input, target)
  h = Hash.new
  input.each do |el|
    return true if h[target - el]
    h[el] = true
  end
  false
end

# p part_one
p part_two