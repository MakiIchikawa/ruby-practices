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

wc = Wc.new(ARGF)
wc_out = WcOut.new(wc.counts(l_option), wc.files_names)

puts wc_out.output
