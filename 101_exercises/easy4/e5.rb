# Forethoughts
=begin

1.
- input:
--- integer > 1
- output:
--- all multiples of 3 and 5 between 1 and input as a sum

4.
- range (1-input), return array of all numbers divisible by 3 or 5
--- reduce array with :+

=end

def multisum(n)
  (1..n).select { |x| x%3==0 || x%5==0 }.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168