# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/frame'

class GameTest < Minitest::Test
  # ゲームクラスの単体テストを行う

  def test_score_method
    game = Game.new(%w[0 10 1 5 0 0 0 0 X X X 5 1 8 1 0 4])
    assert_equal 107, game.score
    game = Game.new(%w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X 6 4 5])
    assert_equal 139, game.score
    game = Game.new(%w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X X X X])
    assert_equal 164, game.score
    game = Game.new(%w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X X 0 0])
    assert_equal 134, game.score
    game = Game.new(%w[X X X X X X X X X X X X])
    assert_equal 300, game.score
  end
end
