class Rover
  attr_accessor :name, :x_coordinate, :y_coordinate, :bearing

  def initialize(name, x_coordinate, y_coordinate, bearing)
    @name = name
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @bearing = bearing
  end

  def read_instruction(instruction)
    instruction.each_char do |char|
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
      @y_coordinate += 1
    when "E"
      @x_coordinate += 1
    when "S"
      @y_coordinate -= 1
    when "W"
      @x_coordinate -= 1
    end
  end

  def report
    puts "Current position of #{@name} is #{@x_coordinate} #{@y_coordinate} #{@bearing.upcase}"
  end

end # class Rover

# TEST:
# spirit = Rover.new("Spirit", 1, 2, "N")
# spirit.read_instruction("LMLMLMLMM")
# spirit.report
#
# opportunity = Rover.new("Opportunity", 3, 3, "E")
# opportunity.read_instruction("MMRMMRMRRM")
# opportunity.report

# TODO:
# - Accept 5 inputs with [gets]; see below, broken
# - Mission Control class
# - Plateau class

puts "Rover name:"
name = gets.chomp

puts "West-to-East position, in grid units:"
x_coordinate = gets.chomp

puts "South-to-North position, in grid units:"
y_coordinate = gets.chomp

# BUG: Throws errors w/ capital letter input
puts "Bearing (N, E, S, W):"
bearing = gets.chomp

rover1 = Rover.new(name, x_coordinate, y_coordinate, bearing)

puts "Complete instructions for travel (L for left, R for right, M to move forward 1 grid unit):"
given_instructions = gets.chomp

# BUG: Not returning updated position
rover1.read_instruction(given_instructions)
rover1.report
