# frozen_string_literal: true

# I am a robot, beep boop.
class Robot
  attr_accessor :facing, :x, :y

  DIRECTIONS = %i[north east south west].freeze

  def initialize(position: [nil, nil], facing: nil)
    @x, @y = position
    @facing = facing
  end

  def place(table:, position:, facing:)
    return unless table.can_place?(position)

    self.x, self.y = position.map(&:to_i)
    self.facing = facing
  end

  def placed?
    x && y
  end

  def report
    return unless placed?

    [x, y, facing].join(',')&.upcase
  end

  def move(table)
    return unless placed?

    case facing
    when :north, :south
      move_y(table)
    when :east, :west
      move_x(table)
    end
  end

  def turn(direction:)
    return unless placed?

    current_direction = DIRECTIONS.index(facing)
    case direction
    when :right
      self.facing = current_direction == DIRECTIONS.length ? DIRECTIONS.first : DIRECTIONS[current_direction + 1]
    when :left
      self.facing = current_direction == DIRECTIONS[0] ? DIRECTIONS.last : DIRECTIONS[current_direction - 1]
    end
  end

  private

  def move_y(table)
    case facing
    when :north
      self.y += 1 if y.zero? || table.y_range === y
    when :south
      self.y -= 1 if y == 5 || table.y_range === y
    end
  end

  def move_x(table)
    case facing
    when :east
      self.x += 1 if x.zero? || table.x_range === x
    when :west
      self.x -= 1 if x == 5 || table.x_range === x
    end
  end
end
