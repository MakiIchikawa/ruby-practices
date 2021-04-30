# frozen_string_literal: true

class Wc
  attr_reader :files, :l_option

  def initialize(l_option = nil)
    @files = []
    @l_option = l_option
  end

  def add_file(file)
    files << file
  end

  def add_file?(file_name)
    !!(files.find { |file| file.file_name == file_name })
  end

  def execute
    output
  end

  private

  def output
    columns = []
    columns << files.map(&:number_of_lines)
    columns << files.map(&:number_of_words) << files.map(&:bytes) unless l_option
    files_multiple = files.length > 1
    columns = add_total_count(columns) if files_multiple
    algined_columns = algin(columns)
    names = files.map(&:file_name)
    names << 'total' if files_multiple
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
