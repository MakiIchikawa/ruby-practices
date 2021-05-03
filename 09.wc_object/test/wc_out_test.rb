# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/wc_out'

class TestWcOut < Minitest::Test
  def setup
    @wcout = WcOut.new([[1, 2, 3], [1, 2, 3], [1, 2, 3]], ['apple.txt', 'orange.txt', 'grape.txt'])
  end

  def test_output
    expected = <<-TEXT
       1       1       1 apple.txt
       2       2       2 orange.txt
       3       3       3 grape.txt
    TEXT
    assert_equal expected, @wcout.output
  end
end
