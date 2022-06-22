#!/usr/bin/env ruby

require_relative 'lib/simulate'

simulate = Simulate.new

commands = File.readlines('commands.txt')
commands.each do |command|
  command.chomp!
  case command
  when /PLACE./
    command_attributes = command.split(' ').last
    x, y, direction = command_attributes.split(',')
    simulate.execute_command(:place, position: [x, y], direction: direction.downcase.to_sym)
  when 'MOVE'
    simulate.execute_command(:move)
  when 'RIGHT'
    simulate.execute_command(:turn, direction: :right)
  when 'LEFT'
    simulate.execute_command(:turn, direction: :left)
  when 'REPORT'
    puts simulate.execute_command(:report)
  end
end
