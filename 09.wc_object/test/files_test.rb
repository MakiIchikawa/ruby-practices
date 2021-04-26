# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/files'
require_relative '../lib/text_file'

class TestFiles < Minitest::Test
  def setup
    @textfile = TextFile.new('test.txt')
    @files = Files.new
  end

  def test_add_file
    @files.add_file(@textfile)
    assert_equal [@textfile], @files.files
  end

  def test_exist?
    @files.add_file(@textfile)
    assert @files.exist?('test.txt')
    refute @files.exist?('tes.txt')
  end
end
