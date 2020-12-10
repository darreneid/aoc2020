require 'byebug'
INPUT = File.readlines('./input.txt').map {|el| el.chomp.split(' ').map {|el| el.split(':')}.map {|el| [el[0].to_sym, el[1]]}}
HCL = '0123456789abcdef'
ECL = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

def validate(key, val)
  # byebug
  case key
  when :byr
    return false if val.length != 4
    return false if val.to_i < 1920
    return false if val.to_i > 2002
    return true
  when :iyr
    return false if val.length != 4
    return false if val.to_i < 2010
    return false if val.to_i > 2020
    return true
  when :eyr
    return false if val.length != 4
    return false if val.to_i < 2020
    return false if val.to_i > 2030
    return true
  when :hgt
    if val[-2..-1] == 'in'
      return false if val[0...-2].to_i < 59
      return false if val[0...-2].to_i > 76
      return true
    elsif val[-2..-1] == 'cm'
      return false if val[0...-2].to_i < 150
      return false if val[0...-2].to_i > 193
      return true
    else
      return false
    end
  when :hcl
    return false if val[0] != '#'
    return false if val[1..-1].length != 6
    return false if val[1..-1].split('').any? {|el| !HCL.include?(el)}
    return true
  when :ecl
    return false if ECL.index(val).nil?
    return true
  when :pid
    return false if val.length != 9
    return true
  end
end

def solve
  pass = {}
  res = 0
  INPUT.each do |el|
    p el
    if el == []
      if [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid].all? {|el1| pass.key?(el1) && validate(el1, pass[el1])}
        res +=1
        p 'yep'
    end
      pass = {}
    else
      el.each do |el2|
        pass[el2[0]] = el2[1]
      end
    end
  end
  res
end

p solve