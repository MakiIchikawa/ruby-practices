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

    @hyphen = TextFile.new('-')
  end

  def test_files_names
    wc = Wc.new([@applefile])
    assert_equal ['apple.txt'], wc.files_names
    wc = Wc.new([@applefile, @orangefile])
    assert_equal ['apple.txt', 'orange.txt', 'total'], wc.files_names
    wc = Wc.new([@hyphen])
    assert_equal nil, wc.files_names
  end

  def test_counts
    wc = Wc.new([@applefile, @orangefile])
    assert_equal [[2, 2, 4], [3, 2, 5], [14, 10, 24]], wc.counts(false)
  end

  def test_counts_l_option
    wc = Wc.new([@testfile])
    assert_equal [[1]], wc.counts(true)
  end
end
