require 'rspec'
require 'rover'

describe 'Rover' do
  it 'creates a new mars rover with a set of given co-ordinates and a cardinal direction' do
    rover = Rover.new(1, 2, 'N')
    expect(rover.x_coordinate).to eq 1
    expect(rover.y_coordinate).to eq 2
    expect(rover.direction).to eq 'N'
  end

  context 'when condition' do
    it 'succeeds' do
      pending 'Not implemented'
    end
  end
end