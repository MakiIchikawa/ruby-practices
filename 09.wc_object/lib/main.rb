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

files = []
text_file = TextFile.new(ARGF.filename)
files << text_file
ARGF.each do |line|
  unless files.map(&:file_name).include?(ARGF.filename)
    text_file = TextFile.new(ARGF.filename)
    files << text_file
  end
  text_file.add_line(line)
end

wc = Wc.new(files)

counts = []
counts << wc.number_of_rows
counts << wc.number_of_words << wc.bytes unless l_option

wc_out = WcOut.new(counts, wc.files_names)

puts wc_out.output
