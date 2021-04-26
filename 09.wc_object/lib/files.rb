# frozen_string_literal: true

class Files
  attr_reader :files

  def initialize
    @files = []
  end

  def add_file(file)
    files << file
  end

  def exist?(file_name)
    !!(files.find { |file| file.file_name == file_name })
  end
end
