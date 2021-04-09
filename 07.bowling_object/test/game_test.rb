# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/frame'

class GameTest < Minitest::Test
  def test_calc_score
    marks = %w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X 6 4 5]
    assert_equal 139, Game.calc_score(marks)
    marks = %w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X X X X]
    assert_equal 164, Game.calc_score(marks)
    marks = %w[0 10 1 5 0 0 0 0 X X X 5 1 8 1 0 4]
    assert_equal 107, Game.calc_score(marks)
    marks = %w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X X 0 0]
    assert_equal 134, Game.calc_score(marks)
    marks = %w[X X X X X X X X X X X X]
    assert_equal 300, Game.calc_score(marks)
  end
end
