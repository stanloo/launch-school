# Forethoughts
=begin

1.
- input:
--- assume the string will always contain a valid number (42 / -42 / +42)
- output:
---signed integer

4.
- check first character of string
--- if + then cut it and call string_to_integer
--- if - then cut it and call string_to_integer with minus sign
--- else call string_to_integer

=end

##### Method from previous exercise
NUMBER_TABLE = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
    '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }

def string_to_integer(str)
  str.reverse!
  number = 0
  str.each_char.with_index do |char, i|
    number += NUMBER_TABLE[char] * (10**i)
  end
  number
end
#####

def string_to_signed_integer(str)
  case str[0]
  when '+' then string_to_integer(str[1..-1])
  when '-' then -string_to_integer(str[1..-1])
  else string_to_integer(str)
  end
end

def string_to_signed_integer(str)
  num = string_to_integer(str.delete('+-'))
  str[0] == '-' ? -num : num
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100