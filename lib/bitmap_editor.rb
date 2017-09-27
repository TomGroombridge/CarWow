require 'pry-byebug'
require './lib/image'
class BitmapEditor

  def initialize
    @image = Image.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each_with_index do |line, index|
      return puts "Sorry but commands must be uppercase" unless line == line.upcase

      line = line.chomp.split(' ')

      if index == 0
        return puts "Sorry but the first command in the file must start with 'I'" unless line.first == "I"
      end


      begin run_command(line)
      rescue => e
        return puts "Sorry we can't run this command due to: #{e}"
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
    when 'S'
      show_image
    else
      raise "command not recognised #{line}"
    end
  end

  def show_image
    return puts "sorry there is no image" if @image.pixels.empty?

    @image.pixels.each {|x| puts x.join(' ').delete(' ')}
  end

end
