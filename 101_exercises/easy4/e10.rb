# Forethoughts
=begin

1.
- input:

- output:


2.


3.


4.


=end

##### From previous exercise
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
#####

def signed_integer_to_string(num)
  case num <=> 0
  when 1 then prepend = '+'
  when -1 then prepend = '-'
  else prepend = ''
  end
    prepend + integer_to_string(num.abs)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'