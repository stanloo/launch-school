=begin

1.
- input:
  - assume it's always a positive integer

2.
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

3.
- Don't use while, until, loop, and each!
- Store integer as string to get number figures

4.
- Turn integer into a string
- Split every character in the string and store it into an array
- Map every array element into an integer (_ turns to zero)
- reduce array to the sum of it's elements

=end

def sum(number)
  figures = number.to_s.split("")
  figures.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45