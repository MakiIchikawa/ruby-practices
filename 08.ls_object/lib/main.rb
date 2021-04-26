#!/bin/bash ruby
# frozen_string_literal: true

require 'optparse'
require 'etc'
require_relative 'ls_short_format'
require_relative 'ls_long_format'
require_relative 'ls_directory'

options = { a: false, r: false }
l_option = false
opt = OptionParser.new

opt.on('-a') { |v| options[:a] = v }
opt.on('-r') { |v| options[:r] = v }
opt.on('-l') { |v| l_option = v }
opt.parse!(ARGV)

directory = LsDirectory.new(ARGV[0])
ls = l_option ? LsLongFormat.new(directory, options) : LsShortFormat.new(directory, options)
puts ls.execute
