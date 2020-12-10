require 'byebug'

INPUT = File.readlines('./input.txt').map {|el| el.chomp}
RULES = Hash.new {|h,k| h[k] = []}
STATUS = Hash.new {|h,k| h[k] = false}

def generate_rules
  INPUT.each do |el|
    i = 4
    words = el.split(' ')
    bag = (words[0] + words[1]).to_sym
    if words[i] == 'no'
      RULES[bag] = []
    else
      while i < words.length
        num = words[i].to_i
        child_bag = (words[i+1] + words[i+2]).to_sym
        num.times {RULES[bag] << child_bag}
        i += 4
      end
    end
  end
end

def contains_gold?(bag_color)
  return STATUS[bag_color] if STATUS.key?(bag_color)

  if RULES[bag_color].empty?
    STATUS[bag_color] = false
    return false
  elsif RULES[bag_color].any? {|el| el == :shinygold}
    STATUS[bag_color] = true
    return true
  else
    RULES[bag_color].each do |el|
      if contains_gold?(el)
        STATUS[bag_color] = true
        return true
      end
    end
  end

  STATUS[bag_color] = false
  false
end

def solve_one
  generate_rules
  res = 0
  
  RULES.each do |k,v|
    res += 1 if contains_gold?(k)
  end
  res
end

def solve_two(bag_color)
  return 0 if RULES[bag_color].empty?
  res = 0

  RULES[bag_color].each do |el|
    res += 1
    res += solve_two(el)
  end

  res
end

p solve_one
p solve_two(:shinygold)