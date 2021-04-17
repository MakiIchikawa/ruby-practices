# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/directory'

class DirectoryTest < Minitest::Test
  def setup
    system('mkdir ~/test')
    system('touch ~/test/.test.txt')
    system('touch ~/test/test.txt')
    @path = '~/test'
  end

  def test_files
    directory = Directory.new(@path)
    files = directory.files({ a: false, l: false })
    assert_equal 'test.txt', files[0].name
  end

  def test_files_a_option
    directory = Directory.new(@path)
    files = directory.files({ a: true, l: false })
    assert_equal '.', files[0].name
    assert_equal '..', files[1].name
    assert_equal '.test.txt', files[2].name
    assert_equal 'test.txt', files[3].name
  end

  def teardown
    system('rm -R ~/test')
  end
end
