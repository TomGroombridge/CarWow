class Command

  def initialize(bitmap, line)
    @bitmap = bitmap
    @line = line.split(' ')
    @colour = @line.last
  end

  def create_bitmap
    num_of_rows = @line[2].to_i
    num_of_collums = @line[1].to_i
    num_of_rows.times do
      @bitmap << Array.new(num_of_collums, '0')
    end
    @bitmap
  end

  def change_pixel_colour
    num_of_collums = string_to_index(@line[1])
    num_of_rows = string_to_index(@line[2])
    @bitmap[num_of_rows][num_of_collums] = @colour
    @bitmap
  end

  def add_vertical_line_color
    line_length(@line[2], @line[3])
    collum = string_to_index(@line[1])
    @bitmap[@line_start..@line_end].each {|i| i[collum] = @colour}
    @bitmap
  end

  def add_horizontal_line
    line_length(@line[1], @line[2])
    row = string_to_index(@line[3])
    (@line_start..@line_end).each {|num| @bitmap[row][num] = @colour}
    @bitmap
  end

  private

  def string_to_index(string)
    string.to_i - 1
  end

  def line_length(start, finish)
    @line_start = string_to_index(start)
    @line_end = string_to_index(finish)
  end

end