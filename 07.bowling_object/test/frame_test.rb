# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  def test_calc_score
    frame = Frame.new
    frame.add_shot('1')
    frame.add_shot('2')
    assert_equal 3, frame.calc_score

    frame = Frame.new
    frame.add_shot('X')
    frame.add_shot('X')
    frame.add_shot('X')
    assert_equal 30, frame.calc_score

    frame = Frame.new
    frame.add_shot('2')
    frame.add_shot('8')
    frame.add_shot('X')
    assert_equal 20, frame.calc_score

    frame = Frame.new
    frame.add_shot('X')
    assert_equal 10, frame.calc_score
  end

  def test_add_shot
    frame = Frame.new
    frame.add_shot('1')
    assert_equal '1', frame.shots[0].mark
    frame.add_shot('2')
    assert_equal '2', frame.shots[1].mark
    frame.add_shot('X')
    assert_equal 'X', frame.shots[2].mark
  end

  def test_second_shot_present?
    frame = Frame.new
    frame.add_shot('X')
    assert_equal false, frame.second_shot_present?

    frame = Frame.new
    frame.add_shot('0')
    frame.add_shot('10')
    assert_equal true, frame.second_shot_present?
  end
end
