# frozen_string_literal: true

# A simple table to house a robot.
class Table
  attr_accessor :max_rows, :max_cols

  def initialize(rows: 5, cols: 5)
    @max_rows = rows
    @max_cols = cols
  end

  def y_range
    (1..max_cols - 1)
  end

  def x_range
    (1..max_rows - 1)
  end

  def can_place?(position)
    x, y = position.map(&:to_i)
    (0..max_cols) === x && (0..max_rows) === y
  end
end
