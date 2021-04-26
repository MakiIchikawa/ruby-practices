#!/bin/bash ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'text_file'
require_relative 'files'

files = Files.new
first_filename = ARGF.filename
text_file = first_filename ? TextFile.new(first_filename) : TextFile.new('-')
files.add_file(text_file)
ARGF.each do |line|
  unless files.exist?(ARGF.filename)
    files.add_file(text_file)
    text_file = TextFile.new(ARGF.filename)
    files.add_file(text_file)
  end
  text_file.add_line(line)
end
