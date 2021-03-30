# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  # フレームクラスの単体テストを行う

  def test_calc_score_method
    frame = Frame.new('1', '2')
    assert_equal 3, frame.calc_score

    frame = Frame.new('X', 'X', 'X')
    assert_equal 30, frame.calc_score

    frame = Frame.new('2', '8', 'X')
    assert_equal 20, frame.calc_score

    frame = Frame.new('X')
    assert_equal 10, frame.calc_score

    frame = Frame.new('1')
    frame.add_shot('2')
    assert_equal 3, frame.calc_score

    frame = Frame.new('1')
    frame.add_shot('2')
    frame.add_shot('X')
    assert_equal 13, frame.calc_score
  end

  def test_second_shot_present?
    frame = Frame.new('X')
    assert_equal false, frame.second_shot_present?

    frame = Frame.new('0', '10')
    assert_equal true, frame.second_shot_present?
  end
end
