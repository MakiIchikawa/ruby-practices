# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/text_file'

class TestTextFile < Minitest::Test
  def setup
    @textfile = TextFile.new('test.txt')
    @textfile.add_line("apple\n")
    @textfile.add_line("orange\n")
    @textfile.add_line("grape pine\n")
  end

  def test_add_lines
    assert_equal ["apple\n", "orange\n", "grape pine\n"], @textfile.lines
  end

  def test_number_of_lines
    assert_equal 3, @textfile.number_of_lines
  end

  def test_number_of_words
    assert_equal 4, @textfile.number_of_words
  end

  def test_bytes
    assert_equal 24, @textfile.bytes
  end
end
