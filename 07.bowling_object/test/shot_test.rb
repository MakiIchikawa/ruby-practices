# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  # ショットクラスの単体テストを行う

  def test_strike_method
    shot = Shot.new('X')
    assert_equal true, shot.strike?

    shot = Shot.new('1')
    assert_equal false, shot.strike?

    shot = Shot.new('10')
    assert_equal false, shot.strike?
  end

  def test_score_method
    shot = Shot.new('X')
    assert_equal 10, shot.score

    shot = Shot.new('1')
    assert_equal 1, shot.score

    shot = Shot.new('2')
    assert_equal 2, shot.score
  end
end
