# frozen_string_literal: true

require_relative '../lib/ls'
require_relative '../lib/output_api'

class LsLongFormat < Ls
  include OutputApi

  def output(files)
    columns = files.each_with_object([]) do |file, rows|
      rows << [file.type + file.permission,
               file.nlink,
               file.owner,
               file.group,
               file.size,
               file.timestamp,
               file.name]
    end.transpose

    rows = algin(columns, 1).transpose
    total = LsDirectory.calc_total_blocks(files)
    join(rows, "total #{total}")
  end
end
