# frozen_string_literal: true

module OutputApi
  private

  def calc_max_word_count(words)
    words.map(&:to_s).map(&:size).max
  end

  def algin(columns, space_count)
    columns.each_with_object([]) do |column, algined_columns|
      columns_length = columns.length
      algined_columns_length = algined_columns.length
      space_count = Array.new(space_count, columns_length) if space_count.is_a?(Integer)
      word_width = calc_max_word_count(column)
      algined_columns << column.each_with_object([]) do |element, algined_column|
        algined_element = element.is_a?(String) ? element.ljust(word_width) : element.to_s.rjust(word_width)
        algined_element << ' ' * space_count[algined_columns_length]
        algined_column << algined_element
      end
    end
  end

  def join(rows, heading = nil)
    output = heading ? "#{heading}\n" : ''
    rows.each do |row|
      output += "#{row.join}\n"
    end
    output
  end
end
