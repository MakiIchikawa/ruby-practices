# frozen_string_literal: true

require 'minitest/autorun'
require './frame'

class FrameTest < Minitest::Test
  def test_initialize
    assert Frame.new('1', '2')
    assert Frame.new('X', 'X', 'X')
    assert Frame.new('2', '8', 'X')
  end

  def test_score
    frame = Frame.new('1', '2')
    assert_equal 3, frame.score
    frame = Frame.new('X', 'X', 'X')
    assert_equal 30, frame.score
    frame = Frame.new('2', '8', 'X')
    assert_equal 20, frame.score
  end
end
