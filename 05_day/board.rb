INPUT = File.readlines('./input.txt').map {|el| el.chomp}

def parse(pass)
  vert_lower = 0
  vert_upper = 127
  hor_lower = 0
  hor_upper = 7

  pass[0...-3].each_char do |el|
    vert_upper = (vert_lower + vert_upper)/2.0.floor if el == 'F'
    vert_lower = (vert_lower + vert_upper)/2.0.ceil if el == 'B'
  end

  pass[-3..-1].each_char do |el|
    hor_upper = (hor_lower + hor_upper)/2.0.floor if el == 'L'
    hor_lower = (hor_upper + hor_lower)/2.0.ceil if el == 'R'
  end

  [vert_upper, hor_upper]
end

def solve
  h = Hash.new {|h,k| h[k] = []}
  INPUT.each do |el|
    row, col = parse(el)
    h[row] << col
  end

  h.each do |k, v|
    return k*8 + if v.length == 7
  end
end

p solve