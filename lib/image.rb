require './lib/validation'
class Image < Validation

  attr_accessor :pixels, :number_of_rows, :number_of_collums

  MAX_ROWS = 250
  MAX_COLLUMS = 250

  def initialize
    self.pixels = []
  end

  def build(line)
    validate_size(line[2].to_i, line[1].to_i)
    self.number_of_rows = line[2].to_i
    self.number_of_collums = line[1].to_i
    number_of_rows.times do
      pixels << Array.new(number_of_collums, '0')
    end
  end

  def change_pixel(line)
    collums = string_to_index(line[1])
    rows = string_to_index(line[2])
    validate_change_pixel_command(collums, rows)

    pixels[rows][collums] = line.last
  end

  def add_vertical_line(line)
    line_length(line[2], line[3])
    collum = string_to_index(line[1])
    pixels[@line_start..@line_end].each {|i| i[collum] = line.last}
  end

  def add_horizontal_line(line)
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

  def validate_image(rows, collums)
    !(rows > MAX_ROWS || collums > MAX_COLLUMS)
  end

end