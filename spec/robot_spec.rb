require 'rspec'
require_relative '../lib/robot'
require_relative '../lib/table'

describe 'Robot' do
  describe 'Placed on table' do
    table = Table.new
    subject { Robot.new(position: [0, 1], facing: :north) }

    describe '#new' do
      it 'creates an instance of Robot' do
        expect(subject).to be_a Robot
      end
    end

    describe '#place' do
      it 'places the robot on the table at x, y, f' do
        subject.place(table: table, position: [1, 1], facing: :north)
        expect(subject.x).to eq(1)
        expect(subject.y).to eq(1)
        expect(subject.facing).to eq(:north)
        expect(subject.report).to eq('1,1,NORTH')
      end
    end

    describe '#move' do
      it 'moves the robot 1 space south' do
        subject.place(table: table, position: [1, 1], facing: :south)
        subject.move(table)
        expect(subject.y).to eq(0)
      end

      it 'will not move the robot off the table' do
        subject.place(table: table, position: [0, 0], facing: :south)
        expect(subject.y).to eq(0)
        subject.move(table)
        expect(subject.y).to eq(0) # we are still at 0
      end
    end

    describe '#turn' do
      it 'rotates the robot 90 degrees to the right' do
        subject.place(table: table, position: [0, 0], facing: :south)
        subject.turn(direction: :right)
        expect(subject.facing).to eq(:west)
      end

      it 'rotates the robot 90 degrees to the left' do
        subject.place(table: table, position: [0, 0], facing: :south)
        subject.turn(direction: :left)
        expect(subject.facing).to eq(:east)
      end
    end

    describe '#report' do
      it 'outputs its position as a string' do
        expect(subject.report).to eq('0,1,NORTH')
      end
    end

    describe '#placed?' do
      it 'returns true if a position is set' do
        expect(subject.placed?).to be_truthy
      end
    end
  end

  describe 'Not placed on table' do
    subject { Robot.new }
    it 'returns false if no position is set' do
      expect(subject.placed?).to be_nil
    end
  end
end
