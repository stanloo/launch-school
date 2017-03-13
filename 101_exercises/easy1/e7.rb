=begin

1.
- input:
  - assume, that it's always a positive integer
- output:
  - string of alternating 1s and 0s, always starting with 1
  - length of the string should match the given integer

2.
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

4.
- every (integer / 2) add '10' to a string
- if integer is odd, add '1' to the string

=end

def stringy(number)
  string = ""
  (number/2).times { string += "10" }
  string += "1" if number.odd?
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


##### Further Exploration
# Method takes a second default parameter
=begin

1.
- input:
  - assume, that first arg always a positive integer
  - second arg is optional
- output:
  - string of alternating 1s and 0s, starting with 1 by default
    - starting with 0 if second arg = 0
  - length of the string should match the given integer

2.
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(7, 2) == '1010101'

4.
- (integer) times add a '1' or '0' to the string, depending on the index
  - start with 1 or 0 based on second arg
- return string

=end

def stringy2(number, start_with=1)
  start_with == 0 ? shift = 1 : shift = 0
  string = ""
  number.times do |index|
    string << ((index+shift).even? ? "1" : "0")
  end
  string
end

puts stringy2(6, 0) == '010101'
puts stringy2(9, 0) == '010101010'
puts stringy2(4) == '1010'
puts stringy2(7, 2) == '1010101'