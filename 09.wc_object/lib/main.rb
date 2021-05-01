#!/bin/bash ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'text_file'
require_relative 'wc'
require_relative 'wc_out'

opt = OptionParser.new
l_option = false
opt.on('-l') { |v| l_option = v }
opt.parse!(ARGV)

wc = Wc.new
text_file = TextFile.new(ARGF.filename)
wc.add_file(text_file)
ARGF.each do |line|
  unless wc.add_files_names.include?(ARGF.filename)
    text_file = TextFile.new(ARGF.filename)
    wc.add_file(text_file)
  end
  text_file.add_line(line)
end

wc_out = WcOut.new

count_columns = []
count_columns << wc.number_of_rows
count_columns << wc.number_of_words << wc.bytes unless l_option
wc_out.set_count_columns(count_columns)

add_files_names = wc.add_files_names
unless add_files_names.all? { |name| name == '-' }
  names_column = add_files_names
  names_column << 'total' if wc.add_files_multiple?
  wc_out.set_name_column(names_column)
end

puts wc_out.output
