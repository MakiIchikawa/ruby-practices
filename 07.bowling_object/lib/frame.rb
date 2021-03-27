# frozen_string_literal: true

require_relative 'shot'
class Frame
  attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
    @third_shot = Shot.new(third_mark)
  end

  def add_shot(shot_mark)
    if @first_shot.mark.nil?
      @first_shot = Shot.new(shot_mark)
    elsif @second_shot.mark.nil?
      @second_shot = Shot.new(shot_mark)
    else
      @third_shot = Shot.new(shot_mark)
    end
  end

  def score
    @first_shot.score + @second_shot.score + @third_shot.score
  end
end
