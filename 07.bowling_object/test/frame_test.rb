# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  # フレームクラスの単体テストを行う

  def test_score_method
    frame = Frame.new('1', '2')
    assert_equal 3, frame.score

    frame = Frame.new('X', 'X', 'X')
    assert_equal 30, frame.score

    frame = Frame.new('2', '8', 'X')
    assert_equal 20, frame.score

    frame = Frame.new('X')
    assert_equal 10, frame.score

    frame = Frame.new('1')
    frame.add_shot('2')
    assert_equal 3, frame.score

    frame = Frame.new('1')
    frame.add_shot('2')
    frame.add_shot('X')
    assert_equal 13, frame.score
  end
end
