# frozen_string_literal: true

class Directory
  attr_reader :absolute_path

  def initialize(path)
    @absolute_path = File.expand_path(path.nil? ? '.' : path)
  end

  def files(option = nil)
    files = []
    file = Struct.new('File', :name)
    Dir.open(absolute_path).each do |f|
      next if option.nil? && f.match?(/^\./)

      files << file.new(f)
    end
    files
  end
end
