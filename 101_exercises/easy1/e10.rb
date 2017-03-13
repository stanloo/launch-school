=begin

1.
- input:
  - assume the input is always valid (positive integer and boolean)
- output:
  - half of number or zero

2.
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

4.
- return number / 2 if true, otherwise return zero

=end

def calculate_bonus(number, bonus)
  bonus ? number / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000