require 'pry-byebug'
require './lib/image'
class BitmapEditor

  def initialize
    @image = Image.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp

      return show_image if line == "S"

      begin run_command(line.split(' '))

      rescue => e
        return puts 'unrecognised command :('
      end
    end

  end

  private

  def run_command(line)
    case line.first
    when 'I'
      @image.build(line)
    when 'L'
      @image.change_pixel(line)
    when 'V'
      @image.add_vertical_line(line)
    when 'H'
      @image.add_horizontal_line(line)
    else
      raise "error"
    end
  end

  def show_image
    return puts "sorry there is no image" if @image.pixels.empty?
    @image.pixels.each {|x| puts x.join(' ').delete(' ')}
  end

end
