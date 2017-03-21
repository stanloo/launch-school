# Forethoughts
=begin

1.
- input:
--- string of numeric characters (no +/- signs)
- output:
--- number as integer

3.
- use hash table for matching

4.
- Can't use any of the standard conversion methods available in Ruby
- Reverse string
- Traverse over every char in string
--- add number * x according to the hash table
----- x = 10**index_of_char in string

=end

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

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

HEXADECIMALS = Hash[ [*'0'..'9', *'A'..'F'].zip(0..15) ]

def hexadecimal_to_integer(str)
  str.split('')
     .reverse
     .map.with_index { |key, i| HEXADECIMALS[key.upcase] * (16**i) }
     .reduce(:+)
end

puts hexadecimal_to_integer('4D9f') == 19871