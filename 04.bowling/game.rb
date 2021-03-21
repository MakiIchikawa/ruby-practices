# frozen_string_literal: true

require './frame'
require './shot'
class Game
  attr_reader :frames

  def initialize(shots)
    @frames = []
    9.times do
      marks = shots.shift(2)
      if marks.first.eql?('X')
        shots.unshift(marks.last)
        marks.pop(1)
      end
      @frames << Frame.new(marks[0], marks[1])
    end
    @frames << Frame.new(shots[0], shots[1], shots[2])
  end

  def score
    game_score = 0
    @frames.each_with_index do |frame, idx|
      frame_score = frame.score
      game_score += frame_score
      break if idx.eql?(9)

      game_score += bonus(frame.first_shot.mark, frames[idx + 1], frames[idx + 2]) if frame_score.eql?(10)
    end
    game_score
  end

  private

  def bonus(strike, next_frame, next_next_frame = nil)
    score = next_frame.first_shot.score
    if strike.eql?('X')
      second_shot = next_frame.second_shot
      score += second_shot.mark ? second_shot.score : next_next_frame.first_shot.score
    end
    score
  end
end
