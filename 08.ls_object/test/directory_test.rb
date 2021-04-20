# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/directory'

class DirectoryTest < Minitest::Test
  def setup
    system('mkdir ~/test')
    system('touch ~/test/.test.txt')
    system('touch ~/test/test.txt')
    @directory = Directory.new('~/test')
  end

  def test_files
    a_option = false
    files = @directory.files(a_option)
    assert_equal 'test.txt', files[0].name
  end

  def test_files_a_option
    a_option = true
    files = @directory.files(a_option)
    assert_equal '.', files[0].name
    assert_equal '..', files[1].name
    assert_equal '.test.txt', files[2].name
    assert_equal 'test.txt', files[3].name
  end

  def test_calc_total_blocks
    directory = Directory.new('~/Desktop')
    a_option = false
    files = directory.files(a_option)
    assert_equal '18808', Directory.calc_total_blocks(files)
  end

  def teardown
    system('rm -R ~/test')
  end
end
