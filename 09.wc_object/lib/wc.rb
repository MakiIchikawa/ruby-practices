# frozen_string_literal: true

class Wc
  attr_reader :files, :l_option

  def initialize(files, l_option = nil)
    @files = files
    @l_option = l_option
  end

  def execute
    output
  end

  private

  def output
    columns = []
    columns << files.number_of_rows
    columns << files.number_of_words << files.bytes unless l_option
    columns = add_total_count(columns) if files.multiple?
    algined_columns = algin(columns)
    names = files.files_names
    names << 'total' if files.multiple?
    algined_columns << names.map { |name| " #{name}" } unless names.include?('-')
    output_rows = algined_columns.transpose.map(&:join)
    "#{output_rows.join("\n")}\n"
  end

  def add_total_count(columns)
    columns.map { |column| column << column.sum }
  end

  def algin(columns, column_width = 8)
    columns.each_with_object([]) do |column, algined_columns|
      algined_columns << column.map { |element| element.to_s.rjust(column_width) }
    end
  end
end
