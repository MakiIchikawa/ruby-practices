# frozen_string_literal: true

require 'date'
require 'minitest/autorun'
require_relative '../lib/ls_long_format'
require_relative '../lib/ls_directory'

class LsLongFormatTest < Minitest::Test
  def setup
    system('mkdir ~/test')
    system('touch ~/test/.test.txt')
    system('touch ~/test/test.txt')
    @directory = LsDirectory.new('~/test')
  end

  def test_execute_l_option
    output = "total 0\n"
    time = Time.now.strftime('%_2m %_2d %H:%M')
    output += "-rw-r--r-- 1 ichikawamaki staff 0 #{time} test.txt\n"

    options = { a: false, r: false }
    ls = LsLongFormat.new(@directory, options)
    assert_equal output, ls.execute
  end

  def teardown
    system('rm -R ~/test')
  end
end
