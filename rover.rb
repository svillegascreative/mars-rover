class Rover
  attr_reader :name
  attr_accessor :x_coordinate, :y_coordinate, :bearing

  def initialize(name)
    @name = name
    @x_coordinate = 0
    @y_coordinate = 0
    @bearing = "N"
    start_rover
  end

  def start_rover
    puts "Position of rover?\n(x & y coordinates and bearing, e.g. 3 1 W)"
    position = gets.chomp
    position = position.split(" ")
    @x_coordinate = position[0].to_i
    @y_coordinate = position[1].to_i
    @bearing = position[2]
    # get_instructions
  end

  def get_instructions
    puts "Instructions for rover?\n(L = left, R = right, M = move forward, e.g. LLMMRMLMMR)"
    rover_instructions = gets.chomp
    follow_instruction(rover_instructions)
  end

  def follow_instructions(instruction)
    instruction.each_char do |char|
      if char == "L"
        turn("L")
      elsif char == "R"
        turn("R")
      else
        move
      end
    end
    report
  end

  def turn(direction)
    if direction == "L"
      case @bearing
      when "N" || "n"
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
    puts "Current position of #{name} is #{x_coordinate} #{y_coordinate} #{bearing.upcase}"
  end

  def move_by1
    @y_coordinate += 1
  end

end # class Rover

# TEST:
# spirit = Rover.new("Spirit")
# spirit.turn("L")
# spirit.follow_instructions("LMLMLMLMM")
# spirit.report



# TODO:
# - Accept 5 inputs with [gets]; I've got 2...
# - Mission Control class
# - Plateau class
