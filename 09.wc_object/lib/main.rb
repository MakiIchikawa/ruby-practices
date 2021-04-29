#!/bin/bash ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'text_file'
require_relative 'files'
require_relative 'wc'

opt = OptionParser.new
l_option = false
opt.on('-l') { |v| l_option = v }
opt.parse!(ARGV)

files = Files.new
first_filename = ARGF.filename
text_file = first_filename ? TextFile.new(first_filename) : TextFile.new('-')
files.add_file(text_file)
ARGF.each do |line|
  unless files.exist?(ARGF.filename)
    text_file = TextFile.new(ARGF.filename)
    files.add_file(text_file)
  end
  text_file.add_line(line)
end

wc = Wc.new(files, l_option)
puts wc.execute
