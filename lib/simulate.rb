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
      robot.report
    end
  end

  def formatted_commands(commands)
    return commands if commands.first.start_with?('PLACE')

    first_valid_command_index = commands.index { |c| c.start_with?('PLACE') }
    commands[first_valid_command_index..commands.length - 1]
  end
end
