# frozen_string_literal: true

class Wc
  def initialize
    @files = []
  end

  def add_file(file)
    @files << file
  end

  def add_files_names
    @files.map(&:file_name)
  end

  def add_files_multiple?
    @files.length > 1
  end

  def number_of_rows
    add_total(@files.map(&:number_of_lines))
  end

  def number_of_words
    add_total(@files.map(&:number_of_words))
  end

  def bytes
    add_total(@files.map(&:bytes))
  end

  private

  def add_total(numbers)
    numbers << numbers.sum if add_files_multiple?
    numbers
  end
end
