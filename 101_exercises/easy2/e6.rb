=begin

1.
- output:
  - all odd numbers from 1 to 99 on separate lines

4.
- loop through a range
- put number only if odd

=end

(1..99).each { |x| puts x if x.odd? }

##### Further Exploration
# Solution with Array#select

arr = Array (1..99)
puts arr.select { |x| x % 2 == 1 }
