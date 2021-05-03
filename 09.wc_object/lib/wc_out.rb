# frozen_string_literal: true

class WcOut
  def initialize(counts, names = nil)
    @counts_columns = counts
    @names_column = names
  end

  def output
    out_columns = algin_counts_columns
    out_columns << algin_names_column
    out_rows = out_columns.transpose.map(&:join)
    "#{out_rows.join("\n")}\n"
  end

  private

  def algin_counts_columns(column_width = 8)
    @counts_columns.map do |column|
      column.map { |element| element.to_s.rjust(column_width) }
    end
  end

  def algin_names_column(column_space = 1)
    @names_column.map { |element| ' ' * column_space + element }
  end

end
