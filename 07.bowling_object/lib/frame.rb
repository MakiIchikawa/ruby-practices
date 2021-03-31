# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :shots

  def initialize
    @shots = []
  end

  def add_shot(shot_mark)
    shots << Shot.new(shot_mark)
  end

  def second_shot_present?
    !shots[1].nil?
  end

  def calc_score
    shots.sum(&:calc_score)
  end
end
