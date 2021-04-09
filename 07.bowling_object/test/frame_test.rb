# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  def setup
    @shot1 = Shot.new('1')
    @shot2 = Shot.new('2')
    @shot8 = Shot.new('8')
    @shotx = Shot.new('X')
    @shot0 = Shot.new('0')
    @shot10 = Shot.new('10')
  end

  def test_add_shot
    frame = Frame.new
    frame.add_shot(@shot1)
    assert_equal @shot1, frame.shots[0]
    frame.add_shot(@shot2)
    assert_equal @shot2, frame.shots[1]
    frame.add_shot(@shotx)
    assert_equal @shotx, frame.shots[2]
  end

  def test_calc_score
    frame = Frame.new
    frame.add_shot(@shot1)
    frame.add_shot(@shot2)
    assert_equal 3, frame.calc_score

    frame = Frame.new
    frame.add_shot(@shotx)
    frame.add_shot(@shotx)
    frame.add_shot(@shotx)
    assert_equal 30, frame.calc_score

    frame = Frame.new
    frame.add_shot(@shot2)
    frame.add_shot(@shot8)
    frame.add_shot(@shotx)
    assert_equal 20, frame.calc_score

    frame = Frame.new
    frame.add_shot(@shotx)
    assert_equal 10, frame.calc_score
  end

  def test_second_shot_present?
    frame = Frame.new
    frame.add_shot(@shotx)
    assert_equal false, frame.second_shot_present?

    frame = Frame.new
    frame.add_shot(@shot0)
    frame.add_shot(@shot10)
    assert_equal true, frame.second_shot_present?
  end
end
