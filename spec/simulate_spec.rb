require 'rspec'
require_relative '../lib/simulate'

describe 'Simulate' do
  subject { Simulate.new }

  describe '#new' do
    it 'creates an instance of Simulate' do
      expect(subject).to be_a Simulate
    end

    it 'has a robot' do
      expect(subject.robot).to be_a Robot
    end

    it 'has a table' do
      expect(subject.table).to be_a Table
    end
  end

  describe '#execute_command' do
    it 'executes the place command' do
      subject.execute_command(:place, position: [0, 1], direction: :north)
      expect(subject.robot.facing).to eq(:north)
      expect(subject.robot.x).to eq(0)
      expect(subject.robot.y).to eq(1)
    end

    it 'executes the move command' do
      subject.execute_command(:place, position: [0, 1], direction: :north)
      subject.execute_command(:move)
      expect(subject.robot.y).to eq(2)
    end

    it 'executes the turn command' do
      subject.execute_command(:place, position: [0, 1], direction: :north)
      subject.execute_command(:turn, direction: :right)
      expect(subject.robot.facing).to eq(:east)
    end
  end

  describe '#formatted_commands' do
    it 'formats the input commands to ensure a valid starting command' do
      commands = ['RIGHT', 'LEFT', 'PLACE 0,1,NORTH', 'MOVE', 'REPORT']
      expect(subject.formatted_commands(commands)).to eq(['PLACE 0,1,NORTH', 'MOVE', 'REPORT'])
    end
  end
end
