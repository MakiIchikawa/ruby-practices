# frozen_string_literal: true

require_relative 'file'

class Directory
  attr_reader :absolute_path

  def initialize(path)
    @absolute_path = File.expand_path(path.nil? ? '.' : path)
  end

  def files(options)
    files = []
    Dir.open(absolute_path).each do |f|
      next if !options[:a] && f.match?(/^\./)

      files << File.new("#{absolute_path}/#{f}")
    end
    files
  end
end
