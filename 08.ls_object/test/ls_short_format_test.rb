# frozen_string_literal: true

require 'date'
require 'minitest/autorun'
require_relative '../lib/ls_short_format'
require_relative '../lib/ls_directory'

class LsShortFormatTest < Minitest::Test
  def setup
    system('mkdir ~/test')
    system('touch ~/test/.test.txt')
    system('touch ~/test/test.txt')
    @directory = LsDirectory.new('~/test')
  end

  def test_execute
    output = <<~TEXT
      test.txt   
    TEXT

    options = { a: false, r: false }
    ls = LsShortFormat.new(@directory, options)
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
    ls = LsShortFormat.new(@directory, options)
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

    ls = LsShortFormat.new(@directory, options)
    assert_equal output, ls.execute
  end

  def teardown
    system('rm -R ~/test')
  end
end
