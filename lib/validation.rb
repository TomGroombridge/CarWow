class Validation

  MAX_ROWS = 250
  MAX_COLLUMS = 250

  def validate_size(rows, collums)
    if (rows > MAX_ROWS || collums > MAX_COLLUMS)
      raise 'Sorry this is not a valid number for the rows and collums'
    end
  end

  def validate_change_pixel_command(collums, rows)
    if (collums > self.number_of_collums || rows > self.number_of_rows)
      raise "There aren't these many rows or collums"
    end
  end

end
