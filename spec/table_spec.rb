require 'rspec'
require_relative '../lib/table'

describe 'Table' do
  subject { Table.new }

  describe '#new' do
    it 'creates an instance of Table' do
      expect(subject).to be_a Table
      expect(subject.max_cols).to eq(5)
      expect(subject.max_rows).to eq(5)
    end
  end

  describe '#y_range' do
    it 'contains a range between 0 and max_cols' do
      expect(subject.y_range).to eq(1..4)
    end
  end

  describe '#x_range' do
    it 'contains a range between 0 and max_rows' do
      expect(subject.x_range).to eq(1..4)
    end
  end

  describe '#can_place?' do
    it 'returns true if the position is within the bounds' do
      expect(subject.can_place?([0, 0])).to be_truthy
    end

    it 'returns false if the position is out of bounds' do
      expect(subject.can_place?([0, 6])).to be_falsey
    end
  end
end
