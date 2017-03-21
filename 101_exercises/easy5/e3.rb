# Forethoughts
=begin

1.
- input:
--- string, 2 functions
- output:
--- 0..1439

4.
- split string with : delimiter
- convert strings in to integers
- after_midnight: positive minutes
- befor_midnight: negative minutes

=end

def before_midnight(str)
  hour, minute = str.split(':').map(&:to_i)
  ( (23-hour) * 60 + (60-minute) ) % 1440
end

def after_midnight(str)
  hour, minute = str.split(':').map(&:to_i)
  (hour * 60 + minute) % 1440 # 1440 = minutes per day
end

puts before_midnight('00:00') == 0
puts before_midnight('12:34') == 686
puts before_midnight('24:00') == 0

puts after_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts after_midnight('24:00') == 0
