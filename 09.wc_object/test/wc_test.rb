# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/text_file'
require_relative '../lib/wc'

class TestWc < Minitest::Test
  def setup
    @applefile = TextFile.new('apple.txt')
    @applefile.add_line("pie\n")
    @applefile.add_line("tee juice\n")

    @orangefile = TextFile.new('orange.txt')
    @orangefile.add_line("tee\n")
    @orangefile.add_line("juice\n")

    @testfile = TextFile.new('test.txt')
    @testfile.add_line("test\n")
  end

  def test_add_file
    wc = Wc.new
    wc.add_file(@applefile)
    assert_equal [@applefile], wc.files
  end

  def test_add_file?
    wc = Wc.new
    wc.add_file(@applefile)
    assert wc.add_file?('apple.txt')
    refute wc.add_file?('appl.txt')
  end

  def test_output
    wc = Wc.new
    wc.add_file(@applefile)
    wc.add_file(@orangefile)
    output = <<-TEXT
       2       3      14 apple.txt
       2       2      10 orange.txt
       4       5      24 total
    TEXT
    assert_equal output, wc.execute
  end

  def test_output_l_option_true
    wc = Wc.new(true)
    wc.add_file(@applefile)
    wc.add_file(@orangefile)
    output = <<-TEXT
       2 apple.txt
       2 orange.txt
       4 total
    TEXT
    assert_equal output, wc.execute
  end

  def test_output_multiple_false
    wc = Wc.new
    wc.add_file(@testfile)
    output = <<-TEXT
       1       1       5 test.txt
    TEXT
    assert_equal output, wc.execute
  end
end
