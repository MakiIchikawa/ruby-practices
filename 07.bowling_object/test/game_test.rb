# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/frame'

class GameTest < Minitest::Test
  def setup
    @frame = Frame.new
    @frame.add_shot(Shot.new('2'))
    @frame.add_shot(Shot.new('3'))
    @frame_spare = Frame.new
    @frame_spare.add_shot(Shot.new('0'))
    @frame_spare.add_shot(Shot.new('10'))
    @frame_strike = Frame.new
    @frame_strike.add_shot(Shot.new('X'))
  end

  def test_add_frame
    game = Game.new
    assert_equal [], game.frames
    game.add_frame(@frame_spare)
    assert_equal [@frame_spare], game.frames
    game.add_frame(@frame_normal)
    assert_equal [@frame_spare, @frame_normal], game.frames
  end

  def test_add_last_frame?
    game = Game.new
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    assert game.add_last_frame?
  end

  def test_calc_score
    game = Game.new
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame_strike)
    game.add_frame(@frame_strike)
    game.add_frame(@frame_strike)
    game.add_frame(@frame)
    game.add_frame(@frame_spare)
    game.add_frame(@frame)
    game.add_frame(@frame)
    game.add_frame(@frame)
    assert_equal 109, game.calc_score
  end
end
