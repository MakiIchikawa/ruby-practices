# frozen_string_literal: true

require_relative 'ls_file'

class LsDirectory
  attr_reader :absolute_path

  def initialize(path)
    @absolute_path = File.expand_path(path.nil? ? '.' : path)
  end

  def files(a_option)
    files = []
    Dir.open(absolute_path).each do |f|
      next if !a_option && f.match?(/^\./)

      files << LsFile.new(f, absolute_path)
    end
    files.sort_by(&:name)
  end

  def self.calc_total_blocks(files)
    files.sum(&:blocks).to_s
  end
end
