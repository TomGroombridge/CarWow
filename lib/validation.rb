class Validation

  MAX_ROWS = 250
  MAX_columns = 250

  def validate_size(line)
    raise "Command format seems incorrect" if line.length != 3
    raise "Can't plot numbers that are negative or zero" unless number_greater_than_zero?([line[1],line[2]])

    if (line[2].to_i > MAX_ROWS || line[1].to_i > MAX_columns)
      raise 'Too many rows or columns'
    end
  end

  def validate_change_pixel(line)
    raise "Command format seems incorrect" if line.length != 4

    raise "Can't plot numbers that are negative or zero" unless number_greater_than_zero?([line[1],line[2]])

    if (line[1].to_i > number_of_columns || line[2].to_i > number_of_rows)
      raise "There are not enough rows or columns in the image to excute 'L'"
    end
  end

  def validate_vertical_line(line)
    raise "Command format seems incorrect" if line.length != 5
    raise "Can't plot numbers that are negative or zero" unless number_greater_than_zero?([line[1],line[2],line[3]])

    if (line[1].to_i > number_of_columns || line[2].to_i > number_of_rows || line[3].to_i > number_of_rows)
      raise "There are not enough rows or columns in the image to excute 'V'"
    end
  end

  def validate_horizontal_line(line)
    raise "Command format seems incorrect" if line.length != 5
    raise "Can't plot numbers that are negative or zero" unless number_greater_than_zero?([line[1],line[2],line[3]])

    if (line[1].to_i > number_of_columns || line[2].to_i > number_of_columns || line[3].to_i > number_of_rows)
      raise "There are not enough rows or columns in the image to excute 'H'"
    end
  end

  private

  def number_greater_than_zero?(commands=[])
    commands.each do |command|
      return false unless command.to_i.positive?
    end
    return true
  end

end
