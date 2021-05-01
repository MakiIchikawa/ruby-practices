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
first_filename = ARGF.filename
text_file = first_filename ? TextFile.new(first_filename) : TextFile.new('-')
wc.add_file(text_file)
ARGF.each do |line|
  unless wc.add_file_names.include?(ARGF.filename)
    text_file = TextFile.new(ARGF.filename)
    wc.add_file(text_file)
  end
  text_file.add_line(line)
end

count_columns = []
count_columns << wc.number_of_rows
count_columns << wc.number_of_words << wc.bytes unless l_option
wc_out = WcOut.new
add_file_names = wc.add_file_names
wc_out.set_count_columns(count_columns)
wc_out.set_name_column(add_file_names) unless add_file_names.all? { |name| name == '-' }

puts wc_out.output
