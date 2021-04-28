# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/text_file'
require_relative '../lib/files'
require_relative '../lib/wc'

class TestWc < Minitest::Test
  def setup
    @fruitfiles = Files.new
    textfile = TextFile.new('apple.txt')
    textfile.add_line("pie\n")
    textfile.add_line("tee juice\n")
    @fruitfiles.add_file(textfile)

    textfile = TextFile.new('orange.txt')
    textfile.add_line("tee\n")
    textfile.add_line("juice\n")
    @fruitfiles.add_file(textfile)

    @testfiles = Files.new
    testfile = TextFile.new('test.txt')
    testfile.add_line("test\n")
    @testfiles.add_file(testfile)
  end

  def test_output
    wc = Wc.new(@fruitfiles)
    output = <<-TEXT
      2      3     14 apple.txt
      2      2     10 orange.txt
      4      5     24 total
    TEXT
    assert_equal output, wc.output
  end

  def test_output_l_option_true
    wc = Wc.new(@fruitfiles, true)
    output = <<-TEXT
      2 apple.txt
      2 orange.txt
      4 total
    TEXT
    assert_equal output, wc.output
  end

  def test_output_multiple_false
    wc = Wc.new(@testfiles)
    output = <<-TEXT
      1      1      5 test.txt
    TEXT
    assert_equal output, wc.output
  end
end
