# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls_file'

class TestFile < Minitest::Test
  def setup
    absolute_path = File.expand_path('~/Desktop')
    @file = LsFile.new('1332', absolute_path)
    @current_dir = LsFile.new('.', absolute_path)
  end

  def test_type
    assert_equal('-', @file.type)
    assert_equal('d', @current_dir.type)
  end

  def test_permission
    assert_equal('rw-r--r--', @file.permission)
    assert_equal('rwx------', @current_dir.permission)
  end

  def test_timestamp
    assert_equal(' 3 27 17:14', @file.timestamp)
    assert_equal(' 4  2 15:15', @current_dir.timestamp)
  end

  def test_nlink
    assert_equal(1, @file.nlink)
    assert_equal(10, @current_dir.nlink)
  end

  def test_owner
    assert_equal('ichikawamaki', @file.owner)
    assert_equal('ichikawamaki', @current_dir.owner)
  end

  def test_group
    assert_equal('staff', @file.group)
    assert_equal('staff', @current_dir.group)
  end

  def test_size
    assert_equal(981, @file.size)
    assert_equal(320, @current_dir.size)
  end

  def test_blocks
    assert_equal(8, @file.blocks)
    assert_equal(0, @current_dir.blocks)
  end
end
