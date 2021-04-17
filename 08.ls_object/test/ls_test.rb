# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'
require_relative '../lib/directory'

class LsTest < Minitest::Test
  def setup
    system('mkdir ~/test')
    system('touch ~/test/.test.txt')
    system('touch ~/test/test.txt')
    @directory = Directory.new('~/test')
  end

  def test_execute
    output = <<~TEXT
      test.txt
    TEXT

    options = { a: false, r: false, l: false }
    ls = Ls.new(@directory, options)
    assert_equal output, ls.execute
  end

  def test_execute_a_option
    output = <<~TEXT
      .
      ..
      .test.txt
      test.txt
    TEXT

    options = { a: true, r: false, l: false }
    ls = Ls.new(@directory, options)
    assert_equal output, ls.execute
  end

  def test_execute_r_option
    output = <<~TEXT
      test.txt
      .test.txt
      ..
      .
    TEXT

    options = { a: true, r: true, l: false }

    ls = Ls.new(@directory, options)
    assert_equal output, ls.execute
  end

  def teardown
    system('rm -R ~/test')
  end
end
