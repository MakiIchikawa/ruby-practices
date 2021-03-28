# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'
class Game
  attr_reader :frames

  def initialize(shots)
    @frames = []
    frame = Frame.new(nil)
    shots.each do |shot|
      frame.add_shot(shot)
      next if @frames.length == 9

      if shot == 'X' || frame.second_shot.mark
        @frames << frame
        frame = Frame.new(nil)
      end
    end
    @frames << frame if @frames.length == 9
  end

  def score
    game_score = 0
    @frames.each_with_index do |frame, idx|
      frame_score = frame.score
      game_score += frame_score
      break if idx == 9

      game_score += bonus(frame.first_shot, frames[idx + 1], frames[idx + 2]) if frame_score == 10
    end
    game_score
  end

  private

  def bonus(shot, next_frame, next_next_frame = nil)
    score = next_frame.first_shot.score
    if shot.strike?
      second_shot = next_frame.second_shot
      score += second_shot.mark ? second_shot.score : next_next_frame.first_shot.score
    end
    score
  end
end
