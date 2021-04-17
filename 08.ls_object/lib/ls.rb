# frozen_string_literal: true

class Ls
  attr_reader :directory, :options

  def initialize(directory, options)
    @directory = directory
    @options = options
  end

  def execute
    files = directory.files(options)
    output_long_false(files)
  end

  private

  def output_long_false(files)
    output = ''
    columns = []
    files_number = files.length
    number = calc_number_of_column_and_row(files_number)
    files.each_slice(number[:row]) do |column_files|
      columns << column_files.map(&:name)
    end
    columns.each_with_index do |column, index|
      break if index + 1 == number[:column]

      width = calc_max_word_count(column) + 3
      column.map! { |file_name| file_name.ljust(width) }
    end
    rows = transpose(columns)
    rows.each do |row|
      output += "#{row.join}\n"
    end
    output
  end

  def calc_max_word_count(words)
    words.map(&:size).max
  end

  def calc_number_of_column_and_row(files_number, max_column_number = 3, default_row_number = 4)
    number = { row: 0, colomn: 0 }
    custom_row_number = (files_number.to_f / max_column_number).ceil
    custom_colomn_number = (files_number.to_f / default_row_number).ceil
    number[:row] = if files_number <= max_column_number * default_row_number
                     default_row_number
                   else
                     custom_row_number
                   end
    number[:column] = if files_number <= default_row_number * 2
                        custom_colomn_number
                      else
                        max_column_number
                      end
    number
  end

  def transpose(array)
    array[0].zip(*array[1..-1])
  end
end
