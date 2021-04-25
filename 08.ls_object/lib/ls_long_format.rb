# frozen_string_literal: true

require_relative '../lib/ls'

class LsLongFormat < Ls

  private

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

    rows = algin(columns, [2, 1, 2, 2, 1, 1, 0]).transpose
    total = LsDirectory.calc_total_blocks(files)
    join(rows, "total #{total}")
  end
end
