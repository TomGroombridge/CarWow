require 'pry-byebug'
require './lib/command'
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

  private

  def run_command(line)
    @command = Command.new(@bitmap, line)

    case line.split(' ').first
    when 'I'
      @command.create_bitmap
    when 'L'
      @command.change_pixel_colour
    when 'V'
      @command.add_vertical_line_color
    when 'H'
      @command.add_horizontal_line
    else
      raise "error"
    end
  end

  def show_bitmap
    @bitmap.map do |row|
      puts row.join(' ').delete(' ')
    end
  end

end
