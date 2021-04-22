# frozen_string_literal: true

module OutputApi
  private

  def calc_max_word_count(words)
    words.map!(&:to_s)
    words.map(&:size).max
  end

  def algin(columns, white_character_count)
    columns.each_with_index do |column, index|
      break if index + 1 == columns.length

      whitespace = if white_character_count.is_a?(Integer)
                     ' ' * white_character_count
                   else
                     ' ' * white_character_count[index]
                   end
      width = calc_max_word_count(column)
      column.map! do |element|
        element.is_a?(String) && element.ljust(width)
        element.is_a?(Integer) && element.to_s.rjust(width)
        element << whitespace
      end
    end
    columns
  end

  def join(rows, heading = nil)
    output = heading ? "#{heading}\n" : ''
    rows.each do |row|
      output += "#{row.join}\n"
    end
    output
  end
end
