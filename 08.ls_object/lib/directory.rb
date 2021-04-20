# frozen_string_literal: true

require_relative 'ls_file'

class Directory
  attr_reader :absolute_path

  def initialize(path)
    @absolute_path = File.expand_path(path.nil? ? '.' : path)
  end

  def files(options)
    files = []
    Dir.open(absolute_path).each do |f|
      next if !options[:a] && f.match?(/^\./)

      files << LsFile.new(f, absolute_path)
    end
    files
  end

  def self.calc_total_blocks(files)
    files.inject(0) { |total, file| total + file.blocks }.to_s
  end
end
