# frozen_string_literal: true

require_relative 'robot'
require_relative 'table'

# The simulate class executes the commands.
class Simulate
  attr_accessor :robot, :table, :directions

  def initialize
    @robot = Robot.new
    @table = Table.new
  end

  def execute_command(command, **args)
    case command
    when :place
      robot.place(table: table, position: args[:position], facing: args[:direction])
    when :move
      robot.move(table)
    when :turn
      robot.turn(direction: args[:direction])
    when :report
      puts robot.report
    end
  end
end
