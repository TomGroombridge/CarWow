require 'pry-byebug'
class BitmapEditor

  def initialize
    @bitmap = []
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp

      if line == "S"
        return puts "sorry there is no image" if @bitmap.empty?
        return show_bitmap
      end

      begin run_command(line)
      rescue => e
        return puts 'unrecognised command :('
      end
    end

  end

  def run_command(line)
    command = line.split(' ')
    @colour = command.last

    case command.first
    when 'I'
      create_bitmap(command)
    when 'L'
      change_pixel_color(command)
    when 'V'
      add_vertical_line_color(command)
    when 'H'
      add_horizontal_line(command)
    else
      raise "error"
    end
  end

  private

  def create_bitmap(chars)
    num_of_rows = chars[2].to_i
    num_of_collums = chars[1].to_i
    num_of_rows.times do
      @bitmap << Array.new(num_of_collums, '0')
    end
  end

  def show_bitmap
    @bitmap.map do |x|
      p x.join(' ').delete(' ')
    end
  end

  def change_pixel_color(chars)
    num_of_collums = string_to_index(chars[1])
    num_of_rows = string_to_index(chars[2])
    @bitmap[num_of_rows][num_of_collums] = @colour
  end

  def add_vertical_line_color(chars)
    line_length(chars[2], chars[3])
    collum = string_to_index(chars[1])
    @bitmap[@line_start..@line_end].each {|i| i[collum] = @colour}
  end

  def add_horizontal_line(chars)
    line_length(chars[1], chars[2])
    row = string_to_index(chars[3])
    (@line_start..@line_end).each {|num| @bitmap[row][num] = @colour}
  end

  def color(chars)
    chars.last
  end

  def string_to_index(string)
    string.to_i - 1
  end

  def line_length(start, finish)
    @line_start = string_to_index(start)
    @line_end = string_to_index(finish)
  end

end
