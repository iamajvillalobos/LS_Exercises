require 'date'

def friday_13th?(year)
  calendar = Date.new(year)..Date.new(year, -1, -1)
  fridays = calendar.select { |day| day.friday? }
  fridays.select { |friday| friday.day == 13 }.count
end


puts friday_13th?(2015) # 3
puts friday_13th?(1986) # 1
