require './lib/validation'
class Image < Validation

  attr_accessor :pixels

  def initialize
    @pixels = []
  end

  def build(line)
    validate_size(line)

    rows = line[2].to_i
    collums = line[1].to_i
    rows.times do
      pixels << Array.new(collums, '0')
    end
  end

  def clear
    @pixels = @pixels.map do |array|
      array.map{|x| '0'}
    end
  end

  def change_pixel(line)
    validate_change_pixel(line)
    collums = string_to_index(line[1])
    rows = string_to_index(line[2])

    pixels[rows][collums] = line.last
  end

  def add_vertical_line(line)
    validate_vertical_line(line)
    line_length(line[2], line[3])
    collum = string_to_index(line[1])
    pixels[@line_start..@line_end].each {|i| i[collum] = line.last}
  end

  def add_horizontal_line(line)
    validate_horizontal_line(line)
    line_length(line[1], line[2])
    row = string_to_index(line[3])
    (@line_start..@line_end).each {|num| pixels[row][num] = line.last}
  end

  private

  def string_to_index(string)
    string.to_i - 1
  end

  def line_length(start, finish)
    @line_start = string_to_index(start)
    @line_end = string_to_index(finish)
  end

  def number_of_collums
    pixels.first.count
  end

  def number_of_rows
    pixels.count
  end

end