#!/bin/bash ruby
# frozen_string_literal: true

require_relative 'game'

marks = ARGV[0].split(',')
frame = Frame.new
game = Game.new

marks.each do |mark|
  shot = Shot.new(mark)
  frame.add_shot(shot)
  next if game.add_last_frame?

  if shot.strike? || frame.second_shot_present?
    game.add_frame(frame)
    frame = Frame.new
  end
end
game.add_frame(frame) if game.add_last_frame?
puts game.calc_score
