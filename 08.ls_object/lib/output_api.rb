# frozen_string_literal: true

module OutputApi
  private

  def calc_max_word_count(words)
    words.map(&:size).max
  end

  def algin(columns, white_character_count)
    columns.each_with_index do |column, index|
      break if index + 1 == columns.length

      width = calc_max_word_count(column) + white_character_count
      column.map! { |element| element.ljust(width) }
    end
    columns
  end

  def join(rows, heading=nil)
    output = heading ? heading + "\n" : ''
    rows.each do |row|
      output += "#{row.join}\n"
    end
    output
  end
end
