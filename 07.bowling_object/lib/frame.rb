# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize
    @shots = []
  end

  def add_shot(shot)
    shots << shot
  end

  def second_shot_present?
    !shots[1].nil?
  end

  def calc_score
    shots.sum(&:score)
  end
end
