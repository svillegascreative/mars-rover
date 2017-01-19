class Rover
  attr_accessor :name :x_coord, :y_coord, :bearing

  def initialize(name, x_coord, y_coord, bearing)
    @name = name
    @x_coord = x_coord
    @y_coord = y_coord
    @bearing = bearing
  end

  def read_instruction(instruction)
    @instruction.each_char do |char|
      if char == "L"
        turn("L")
      elsif char == "R"
        turn("R")
      else
        move
      end
    end
  end

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

# TEST:
# spirit = Rover.new(1, 2, "N")
# spirit.read_instruction("LMLMLMLMM")
# spirit.report
#
# opportunity = Rover.new(3, 3, "E")
# opportunity.read_instruction("MMRMMRMRRM")
# opportunity.report

# TODO:
# - Accept 5 inputs with [gets]
# - Mission Control class
# - Plateau class
