# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/text_file'

class TestTextFile < Minitest::Test
  def test_add_lines
    textfile = TextFile.new('test.txt')
    textfile.add_line("apple\n")
    textfile.add_line("orange\n")
    textfile.add_line("grape\n")
    assert_equal %W[apple\n orange\n grape\n], textfile.lines
  end
end
