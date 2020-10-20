require "./spec_helper"
require '../rover'

describe 'Rover' do
  it 'creates a new mars rover with a set of given co-ordinates and a cardinal direction' do
    rover = Rover.new(1, 2, 'N')
    expect(rover.x_coordinate).to eq 1
    expect(rover.y_coordinate).to eq 2
    expect(rover.direction).to eq 'N'
  end

  context 'To describe when the rover is in the north facing direction' do
    it "rover to move 1 position if the input is 'M' and the 'N' direction" do
      rover = Rover.new(4, 1, 'N')
      rover.rover_navigator('M')
      expect(rover.y_coordinate).to eq 2
    end

    it "will test to see if the rover to see if the Rover will not fall from the surface plateau" do
      rover = Rover.new(1,3, 'N')
      5.times do
        rover.rover_navigator('M')
      end
      expect(rover.y_coordinate).to eq Rover::PLATEAU_BORDERS[1]
    end
  end

  context 'To describe when the rover is in the south facing direction' do
    it "rover to move 1 position if the input is 'M' and the 'S' direction" do
      rover = Rover.new(1, 0, 'S')
      rover.rover_navigator('M')
      expect(rover.y_coordinate).to eq 3
    end

    it "will test to see if the rover to see if the Rover will not fall from the surface plateau" do
      rover = Rover.new(1,3, 'S')
      5.times do
        rover.rover_navigator('M')
      end
      expect(rover.y_coordinate).to eq Rover::PLATEAU_BORDERS[0]
    end
  end

  context 'Describes the Rover is turning right' do
    it 'will turn East when in the North facing direction' do
      rover = Rover.new(3, 3, 'N')
      rover.rover_navigator('R')
      expect(rover.move_rover).to eq 'E'
    end

    it 'will turn South in the East facing direction' do
      rover = Rover.new(3, 3, 'E')
      rover.rover_navigator('R')
      expect(rover.move_rover).to eq 'S'
    end

    it 'will turn West when in the South facing direction' do
      rover = Rover.new(3, 3, 'S')
      rover.rover_navigator('R')
      expect(rover.move_rover).to eq 'W'
    end

    it 'will turn North when in the West facing direction' do
      rover = Rover.new(3, 3, 'W')
      rover.rover_navigator('R')
      expect(rover.move_rover).to eq 'N'
    end
  end

  context 'Describe for when the Rover is turning left' do
    it 'will turn the Rover West when in the North facing direction' do
      rover = Rover.new(3, 3, 'N')
      rover.rover_navigator('L')
      expect(rover.move_rover).to eq 'W'
    end

    it 'will turn the Rover North when in the East facing direction' do
      rover = Rover.new(3, 3, 'E')
      rover.rover_navigator('L')
      expect(rover.move_rover).to eq 'N'
    end

    it 'will turn the Rover East when in the South facing' do
      rover = Rover.new(3, 3, 'S')
      rover.rover_navigator('L')
      expect(rover.move_rover).to eq 'E'
    end

    it 'will turn the Rover South when in the West facing' do
      rover = Rover.new(3, 3, 'W')
      rover.rover_navigator('L')
      expect(rover.move_rover).to eq 'S'
    end
  end
end