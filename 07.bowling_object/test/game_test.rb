# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/frame'

class GameTest < Minitest::Test
  def test_initialize_case1
    game = Game.new(%w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X 6 4 5])
    shot_marks = []
    game.frames.each do |frame|
      shot_marks << [frame.first_shot.mark, frame.second_shot.mark, frame.third_shot.mark].compact
    end
    assert_equal %w[6 3 9 0 0 3 8 2 7 3 X 9 1 8 0 X 6 4 5], shot_marks.flatten
  end

  def test_initialize_case2
    game = Game.new(%w[0 10 1 5 0 0 0 0 X X X 5 1 8 1 0 4])
    shot_marks = []
    game.frames.each do |frame|
      shot_marks << [frame.first_shot.mark, frame.second_shot.mark, frame.third_shot.mark].compact
    end
    assert_equal %w[0 10 1 5 0 0 0 0 X X X 5 1 8 1 0 4], shot_marks.flatten
  end

  def test_score_case1
    game = Game.new(%w[0 10 1 5 0 0 0 0 X X X 5 1 8 1 0 4])
    assert_equal 107, game.score
  end

  def test_score_case2
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
