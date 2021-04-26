
# frozen_string_literal: true

class Wc
  attr_reader :files, :l_option

  def initialize(files, l_option)
    @files = files
    @l_option = l_option
  end
end