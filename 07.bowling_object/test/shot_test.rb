# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  def test_strike
    shot = Shot.new('X')
    assert shot.strike?

    shot = Shot.new('1')
    refute shot.strike?

    shot = Shot.new('10')
    refute shot.strike?
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
