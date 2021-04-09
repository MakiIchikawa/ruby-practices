#!/bin/bash ruby
# frozen_string_literal: true

require_relative 'game'

marks = ARGV[0].split(',')
puts Game.calc_score(marks)
