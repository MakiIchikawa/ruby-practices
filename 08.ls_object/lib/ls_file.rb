# frozen_string_literal: true

class LsFile
  attr_reader :name, :file

  FILE_TYPE = {
    'file' => '-',
    'directory' => 'd',
    'characterSpecial' => 'c',
    'blockSpecial' => 'b',
    'fifo' => 'p',
    'link' => 'l',
    'socket' => 's',
    'unknown' => '?'
  }.freeze

  PERMISSION = {
    '0' => '---',
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }.freeze

  def initialize(name, path)
    @name = name
    absolute_path = File.expand_path(name, path)
    @file = File::Stat.new(absolute_path)
  end

  def type
    FILE_TYPE[file.ftype]
  end

  def permission
    file.mode.to_s(8)[-3..-1].chars.map do |i|
      PERMISSION[i]
    end.join
  end

  def timestamp
    mtime = file.mtime
    [mtime.strftime('%-m').rjust(2), mtime.day.to_s.rjust(2), mtime.strftime('%H:%M')].join(' ')
  end

  def nlink
    file.nlink.to_s
  end

  def owner
    Etc.getpwuid(file.uid).name
  end

  def group
    Etc.getgrgid(file.gid).name
  end

  def size
    file.size.to_s
  end

  def blocks
    file.blocks
  end
end

