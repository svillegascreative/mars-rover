class Rover
  attr_accessor :x_coord, :y_coord, :bearing

  def initialize(x_coord, y_coord, bearing)
    @x_coord = x_coord
    @y_coord = y_coord
    @bearing = bearing
  end

  def read_instruction(instruction) # accept 'instruction' as a string
    @instruction = instruction.chars # convert string to array of characters

    @instruction.each do |letter|
      if letter == "L"
        turn("L")
      elsif letter == "R"
        turn("R")
      else
        move
      end
    end
  end # /read_instruction

  def turn(direction)
    if direction == "L"
      case @bearing
      when "N"
        @bearing = "W"
      when "W"
        @bearing = "S"
      when "S"
        @bearing = "E"
      when "E"
        @bearing = "N"
      end
    elsif direction == "R"
      case @bearing
      when "N"
        @bearing = "E"
      when "E"
        @bearing = "S"
      when "S"
        @bearing = "W"
      when "W"
        @bearing = "N"
      end
    end
  end

  def move
    case @bearing
    when "N"
      @y_coord += 1
    when "E"
      @x_coord += 1
    when "S"
      @y_coord -= 1
    when "W"
      @x_coord -= 1
    end
  end

  def report
    puts "Current position is #{@x_coord} #{@y_coord} #{@bearing}"
  end

end

# test
spirit = Rover.new(1, 2, "N")
spirit.read_instruction("LMLMLMLMM")
spirit.report

opportunity = Rover.new(3, 3, "E")
opportunity.read_instruction("MMRMMRMRRM")
opportunity.report
