# frozen_string_literal: true

class TextFile
  attr_reader :file_name, :lines

  def initialize(file_name)
    @file_name = file_name
    @lines = []
  end

  def add_line(line)
    lines << line
  end
end
