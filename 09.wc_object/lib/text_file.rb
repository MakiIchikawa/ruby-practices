# frozen_string_literal: true

class TextFile
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
    @lines = []
  end

  def add_line(line)
    @lines << line
  end

  def number_of_lines
    @lines.length
  end

  def number_of_words
    @lines.sum do |line|
      line.split(/[\s,\n]/).delete_if(&:empty?).length
    end
  end

  def bytes
    @lines.sum(&:bytesize)
  end
end
