# frozen_string_literal: true

class WcOut

  def initialize
    @out_columns = []
  end

  def set_count_columns(columns, column_width = 8)
    columns.each do |column|
      @out_columns << column.map { |element| element.to_s.rjust(column_width) }
    end
  end

  def set_name_column(column, column_space = 1)
    @out_columns << column.map { |element| ' ' * column_space + element }
  end

  def output
    out_rows = @out_columns.transpose.map(&:join)
    "#{out_rows.join("\n")}\n"
  end
end
