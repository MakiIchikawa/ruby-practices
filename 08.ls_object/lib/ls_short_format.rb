# frozen_string_literal: true

require_relative '../lib/ls'
require_relative '../lib/output_api'

class LsShortFormat < Ls
  include OutputApi

  private

  def output(files)
    columns = []
    files_number = files.length
    number_of_row = calc_number_of_row(files_number)
    files.each_slice(number_of_row) do |column_files|
      columns << column_files.map(&:name)
    end
    rows = transpose(algin(columns, 3))
    join(rows)
  end

  def calc_number_of_row(files_number, max_column_number = 3, default_row_number = 4)
    custom_row_number = (files_number.to_f / max_column_number).ceil
    if files_number <= max_column_number * default_row_number
      default_row_number
    else
      custom_row_number
    end
  end

  def transpose(array)
    array[0].zip(*array[1..-1])
  end
end
