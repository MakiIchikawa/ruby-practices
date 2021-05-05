# frozen_string_literal: true

class Wc
  def initialize(argf)
    @files = []
    text_file = TextFile.new(argf.filename)
    @files << text_file
    argf.each do |line|
      unless @files.map(&:file_name).include?(argf.filename)
        text_file = TextFile.new(ARGF.filename)
        @files << text_file
      end
      text_file.add_line(line)
    end
  end

  def files_names
    return if @files.all? { |file| file.file_name == '-' }

    add_total(@files.map(&:file_name))
  end

  def counts(l_option)
    counts = [number_of_lines]
    counts << number_of_words << bytes unless l_option
    counts
  end

  private

  def number_of_lines
    add_total(@files.map(&:number_of_lines))
  end

  def number_of_words
    add_total(@files.map(&:number_of_words))
  end

  def bytes
    add_total(@files.map(&:bytes))
  end

  def add_total(counts_or_names)
    if @files.length > 1
      counts_or_names << (counts_or_names.all?(String) ? 'total' : counts_or_names.sum)
    end
    counts_or_names
  end
end
