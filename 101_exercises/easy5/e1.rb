# Forethoughts
=begin

1.
- input:
--- string with valid ascii characters
- output:
--- sum of ordinal values of characters in string

=end

def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

def ascii_value(str)
  str.split('').inject(0) { |memo, char| memo + char.ord }
end

def ascii_value(str)
  str.chars.map(&:ord).inject(0, :+)
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0