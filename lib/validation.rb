class Validation

  MAX_ROWS = 250
  MAX_COLLUMS = 250

  def validate_size(line)
    raise "Command format seems incorrect" if line.length != 3

    if (line[2].to_i > MAX_ROWS || line[1].to_i > MAX_COLLUMS)
      raise 'Too many rows or collums'
    end
  end

  def validate_change_pixel(line)
    raise "Command format seems incorrect" if line.length != 4

    if (line[1].to_i > number_of_collums || line[2].to_i > number_of_rows)
      raise "There are not enough rows or collums in the image to excute 'L'"
    end
  end

  def validate_vertical_line(line)
    raise "Command format seems incorrect" if line.length != 5

    if (line[1].to_i > number_of_collums || line[2].to_i > number_of_rows || line[3].to_i > number_of_rows)
      raise "There are not enough rows or collums in the image to excute 'V'"
    end
  end

  def validate_horizontal_line(line)
    raise "Command format seems incorrect" if line.length != 5

    if (line[1].to_i > number_of_collums || line[2].to_i > number_of_collums || line[3].to_i > number_of_rows)
      raise "There are not enough rows or collums in the image to excute 'H'"
    end
  end

end
