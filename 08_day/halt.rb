require 'byebug'

class Console
  def initialize(path)
    @prog = File.readlines(path).map {|el| el.chomp}
    @count = Hash.new(0)
    @acc = 0
  end
  
  def run
    line = 0
    while line != 653
      cmd, val = parse(@prog[line])
      @count[line] += 1
      return false if @count[line] == 2

      case cmd
      when 'nop'
        line += 1
      when 'acc'
        @acc += val
        line += 1
      when 'jmp'
        line += val
      end
    end

    @acc
  end

  def brute_force
    index = 0
    
    while true
      cmd, val = parse(@prog[index])
      
      case cmd
      when 'jmp'
        cmd = 'nop'
      when 'nop'
        cmd = 'jmp'
      end

      @prog[index] = cmd + ' ' + val.to_s
      res = run
      return res if res
      reset
      index += 1
    end
  end

  def parse(line)
    cmd, val = line.split
    [cmd, val.to_i]
  end

  def reset
    @prog = File.readlines('./input.txt').map {|el| el.chomp}
    @count = Hash.new(0)
    @acc = 0
  end
end

con = Console.new('./input.txt')
p con.brute_force