# frozen_string_literal: true

require_relative '../lib/output_common_functions'

class Ls
  include OutputCommonFunctions

  attr_reader :directory, :options

  def initialize(directory, options)
    @directory = directory
    @options = options
  end

  def execute
    files = directory.files(options[:a])
    files.reverse! if options[:r]
    output(files)
  end

  private

  def output(files); end
end
