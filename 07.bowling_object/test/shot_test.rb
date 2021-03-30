# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  def test_strike_method
    shot = Shot.new('X')
    assert_equal true, shot.strike?

    shot = Shot.new('1')
    assert_equal false, shot.strike?

    shot = Shot.new('10')
    assert_equal false, shot.strike?
  end

  def test_calc_score_method
    shot = Shot.new('X')
    assert_equal 10, shot.calc_score

    shot = Shot.new('1')
    assert_equal 1, shot.calc_score

    shot = Shot.new('2')
    assert_equal 2, shot.calc_score
  end
end
