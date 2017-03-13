=begin

1.
- input:
  - array will never be empty
  - numbers will always be positive integers

2.
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

4.
- reduce the array to the sum of it's elements
- divide sum through the size of array

=end

def average(numbers_list)
  sum = numbers_list.reduce(:+)
  sum / numbers_list.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

##### Further Exploration
# Changing the return value to a float

def average(numbers_list)
  sum = numbers_list.reduce(:+)
  sum / numbers_list.size.to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40