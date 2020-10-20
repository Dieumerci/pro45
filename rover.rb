class Rover
  attr_accessor :x_coordinate, :y_coordinate, :direction
  PLATEAU_BORDERS = [0, 8].freeze

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def rover_navigator(input_commands)
    input_command =  input_commands.split('')
    input_command.each do |command|
      case command
      when 'M'
        move_rover
      when 'L' || 'R'
        rover_orientation command
      end
    end
  end

  def move_rover
    case @direction
    when 'N' then @y_coordinate += 1 if @y_coordinate <= PLATEAU_BORDERS[1]
    when 'W' then @y_coordinate -= 1 if @x_coordinate >= PLATEAU_BORDERS[0]
    when 'S' then @y_coordinate -= 1 if @y_coordinate >= PLATEAU_BORDERS[0]
    when 'E' then @y_coordinate += 1 if @x_coordinate <= PLATEAU_BORDERS[1]
    else
      # type code here
    end
  end

  def rover_orientation(input_command)
    if input_command == 'L'
      case @direction
      when 'N' then @direction = 'W'
      when 'W' then @direction = 'S'
      when 'S' then @direction = 'E'
      when 'E' then @direction = 'N'
      end
    else
      case @direction
      when 'N' then @direction = 'E'
      when 'W' then @direction = 'N'
      when 'S' then @direction = 'W'
      when 'E' then @direction = 'S'
      else
        # type code here
      end
    end
  end

  def display_rover_coordinates
    puts "#{@x_coordinate} #{y_coordinate} #{direction}"
  end

  rover = Rover.new(1, 2, 'N')
  rover.rover_navigator('LMLMLMLMM')
  rover.display_rover_coordinates
end