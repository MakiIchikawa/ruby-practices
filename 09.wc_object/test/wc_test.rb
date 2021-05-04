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

  def test_files_names
    wc = Wc.new([@applefile])
    assert_equal ['apple.txt'], wc.files_names
    wc = Wc.new([@applefile, @orangefile])
    assert_equal ['apple.txt', 'orange.txt', 'total'], wc.files_names
  end

  def test_number_of_rows
    wc = Wc.new([@applefile, @orangefile])
    assert_equal [2, 2, 4], wc.number_of_rows
  end

  def test_number_of_words
    wc = Wc.new([@applefile, @orangefile])
    assert_equal [3, 2, 5], wc.number_of_words
  end

  def test_bytes
    wc = Wc.new([@testfile])
    assert_equal [5], wc.bytes
  end
end
