# Forethoughts
=begin

1.
- input:
--- any integer (minutes before or after midnight)
- output:
--- 24h format (xx:xx)
--- may not use Date/Time classes

4.
- min = x mod 60
--- 130 % 60 = 10
--- -130 % 60 = 50 (just what I need!)
- h = x / 60
--- if minus, then h + (y+1) * 24
----- y = h.abs / 24
--- if plus, then h - y * 24
----- y = h / 24

=end

def calculate_hours(minutes)
  hours = minutes / 60
  # Behavior of negative integers in division different
  # # 1400/60 = 23, -1400/60 = 24
  if hours < 0
    blocks24h = (hours.abs - 1) / 24 # Adress for the different behavior with -1
    hours += (blocks24h + 1) * 24
  else
    blocks24h = hours / 24
    hours -= blocks24h * 24
  end
  hours
end

def calculate_minutes(minutes)
  minutes % 60
end

def time_of_day(minutes)
  hour = calculate_hours(minutes)
  minute = calculate_minutes(minutes)
  "#{format('%02d', hour)}:#{format('%02d', minute)}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# Sample solution is much cleverer
# They turn input integer into a positive minute number <= 1400 with...
# ... minutes % 1440