# frozen_string_literal: true

require 'minitest/autorun'
require './shot'

class ShotTest < Minitest::Test
  def test_initialize
    assert Shot.new('X')
    shot = Shot.new('1')
    assert_equal '1', shot.mark
  end

  def test_score
    shot = Shot.new('X')
    assert_equal 10, shot.score
    shot = Shot.new('1')
    assert_equal 1, shot.score
    shot = Shot.new('2')
    assert_equal 2, shot.score
  end
end
