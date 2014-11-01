def date_to_db_string date_string, begining_end = "beginning"
  year, month, day = date_string.split '-'
  Time.new(year, month, day).send("at_#{begining_end}_of_day").to_s(:db)
end
