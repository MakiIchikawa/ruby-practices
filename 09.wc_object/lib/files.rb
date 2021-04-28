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

  def number_of_rows
    files.each_with_object([]) do |file, number|
      number << file.number_of_lines
    end
  end

  def number_of_words
    files.each_with_object([]) do |file, number|
      number << file.number_of_words
    end
  end

  def bytes
    files.each_with_object([]) do |file, bytes|
      bytes << file.bytes
    end
  end

  def files_names
    files.each_with_object([]) do |file, names|
      names << file.file_name
    end
  end

  def multiple?
    files.length > 1
  end
end
