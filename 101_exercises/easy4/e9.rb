# Forethoughts
=begin

1.
- input:
--- positive integer or zero
- output:
--- string

4.
- create empty array
- while num != 0
--- arr << num % 10
--- num /= 10
- return array.reverse.join

=end

NUMBERS = Hash[ [*0..9].zip([*'0'..'9']) ]

def integer_to_string(num)
  return '0' if num == 0
  str = ''
  while num != 0
    str.prepend(NUMBERS[num % 10])
    num /= 10
  end
  str
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'