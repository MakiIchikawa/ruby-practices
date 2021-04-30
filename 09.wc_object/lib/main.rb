#!/bin/bash ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'text_file'
require_relative 'wc'

opt = OptionParser.new
l_option = false
opt.on('-l') { |v| l_option = v }
opt.parse!(ARGV)

wc = Wc.new(l_option)
first_filename = ARGF.filename
text_file = first_filename ? TextFile.new(first_filename) : TextFile.new('-')
wc.add_file(text_file)
ARGF.each do |line|
  unless wc.add_file?(ARGF.filename)
    text_file = TextFile.new(ARGF.filename)
    wc.add_file(text_file)
  end
  text_file.add_line(line)
end

puts wc.execute
