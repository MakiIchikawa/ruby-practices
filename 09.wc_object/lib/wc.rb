# frozen_string_literal: true

class Wc

  def initialize
    @files = []
  end

  def add_file(file)
    @files << file
  end

  def add_file?(file_name)
    !!(@files.find { |file| file.file_name == file_name })
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
    numbers << numbers.sum if @files.length > 1
    numbers
  end
end
