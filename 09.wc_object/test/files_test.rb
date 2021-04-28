# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/files'
require_relative '../lib/text_file'

class TestFiles < Minitest::Test
  def setup
    @testfile = TextFile.new('test.txt')
    @testfiles = Files.new

    @fruitfiles = Files.new
    textfile = TextFile.new('apple.txt')
    textfile.add_line("pie\n")
    textfile.add_line("tee juice\n")
    @fruitfiles.add_file(textfile)

    textfile = TextFile.new('orange.txt')
    textfile.add_line("tee\n")
    textfile.add_line("juice\n")
    @fruitfiles.add_file(textfile)
  end

  def test_add_file
    @testfiles.add_file(@testfile)
    assert_equal [@testfile], @testfiles.files
  end

  def test_exist?
    @testfiles.add_file(@testfile)
    assert @testfiles.exist?('test.txt')
    refute @testfiles.exist?('tes.txt')
  end

  def test_number_of_rows
    assert_equal [2, 2], @fruitfiles.number_of_rows
  end

  def test_number_of_words
    assert_equal [3, 2], @fruitfiles.number_of_words
  end

  def test_bytes
    assert_equal [14, 10], @fruitfiles.bytes
  end

  def test_files_names
    assert_equal ['apple.txt', 'orange.txt'], @fruitfiles.files_names
  end

  def test_multiple?
    assert @fruitfiles.multiple?
  end
end
