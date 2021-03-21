#!/bin/bash ruby
# frozen_string_literal: true

require './game'
game = Game.new(ARGV[0].split(/,/))
puts game.score
