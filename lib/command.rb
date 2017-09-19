class Command

  def initialize(bitmap, line)
    @bitmap = bitmap
    @line = line
    @chars = @line.split(' ')
    @colour = @chars.last
  end

  def create_bitmap
    num_of_rows = @chars[2].to_i
    num_of_collums = @chars[1].to_i
    num_of_rows.times do
      @bitmap << Array.new(num_of_collums, '0')
    end
  end

  def change_pixel_colour
    num_of_collums = string_to_index(@chars[1])
    num_of_rows = string_to_index(@chars[2])
    @bitmap[num_of_rows][num_of_collums] = @colour
  end

  def add_vertical_line_color
    line_length(@chars[2], @chars[3])
    collum = string_to_index(@chars[1])
    @bitmap[@line_start..@line_end].each {|i| i[collum] = @colour}
  end

  def add_horizontal_line
    line_length(@chars[1], @chars[2])
    row = string_to_index(@chars[3])
    (@line_start..@line_end).each {|num| @bitmap[row][num] = @colour}
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