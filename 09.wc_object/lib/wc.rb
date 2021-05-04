# frozen_string_literal: true

class Wc
  def initialize(files)
    @files = files
  end

  def files_names
    add_total(@files.map(&:file_name))
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

  def add_total(counts_or_names)
    if @files.length > 1
      counts_or_names << (counts_or_names.all?(String) ? 'total' : counts_or_names.sum)
    end
    counts_or_names
  end
end
