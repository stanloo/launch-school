=begin

1.
- input:
  - length and width of a room in meters (positive integers or floats)
- output:
  - area of the room in both square meters and square feet
  - square meter == 10.7639 square feet

2.
puts get_area()

4.
- get width and length from user
- multiply width and length and return string

=end

def get_area()
  puts "What is length of room?"
  len = gets.chomp.to_f
  puts "What is width of room?"
  wid = gets.chomp.to_f
  area = (len * wid).round(2)
  "The area of the room is #{area} square meters (#{area * 10.7639} square feet)."
end

puts get_area()

##### Further Exploration
#  input measurements in feet, results in square feet, square inches, and square centimeters


SQFEET_TO_SQCENTIMETERS = 929.03
SQFEET_TO_SQINCHES = 144
def get_area()
  puts "What is length of room?"
  len = gets.chomp.to_f
  puts "What is width of room?"
  wid = gets.chomp.to_f
  area = (len * wid).round(2)
  "The area of the room is #{area} square feet (#{area * SQFEET_TO_SQINCHES}" + 
  " square inches and (#{area * SQFEET_TO_SQCENTIMETERS} square centimeters)."
end

puts get_area()