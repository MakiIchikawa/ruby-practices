# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'

class Game
  LAST_FRAME = 9
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def add_last_frame?
    @frames.length == LAST_FRAME
  end

  def calc_score
    game_score = 0
    @frames.each_with_index do |frame, idx|
      frame_score = frame.calc_score
      game_score += frame_score
      break if idx == LAST_FRAME

      game_score += calc_bonus(frame.shots[0], frames[idx + 1], frames[idx + 2]) if frame_score == 10
    end
    game_score
  end

  private

  def calc_bonus(shot, next_frame, after_next_frame = nil)
    score = next_frame.shots[0].calc_score
    if shot.strike?
      second_shot = next_frame.second_shot_present? ? next_frame.shots[1] : after_next_frame.shots[0]
      score += second_shot.calc_score
    end
    score
  end
end
