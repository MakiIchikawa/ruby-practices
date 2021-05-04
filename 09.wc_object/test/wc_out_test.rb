# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/wc_out'

class TestWcOut < Minitest::Test
  def test_output
    wcout = WcOut.new([[1, 2, 3], [1, 2, 3], [1, 2, 3]], ['apple.txt', 'orange.txt', 'grape.txt'])
    expected = <<-TEXT
       1       1       1 apple.txt
       2       2       2 orange.txt
       3       3       3 grape.txt
    TEXT
    assert_equal expected, wcout.output
  end

  def test_output_names_nil
    wcout = WcOut.new([[1], [1], [1]], nil)
    expected = <<-TEXT
       1       1       1
    TEXT
    assert_equal expected, wcout.output
  end
end
