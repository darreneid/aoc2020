NUMS = File.readlines('./day_one/input.txt').map {|el| el.chomp.to_i}

def part_one
  hsh = {}
  NUMS.each_with_index do |el, i|
    return el*(2020-el) if hsh[2020-el]
    hsh[el] = i
  end

  false
end

p part_one

def part_two
  NUMS.each_with_index do |el, i|
    NUMS.each_with_index do |el2, i2|
      NUMS.each_with_index do |el3, i3|
        next if [i, i2, i3].uniq.length < 3
        return el*el2*el3 if el + el2 + el3 == 2020
      end
    end
  end

  false
end

# p part_two

