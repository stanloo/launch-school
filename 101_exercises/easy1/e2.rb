=begin

1.
- input:
  - assume that floats are whole numbers (4.0, 3.0, ...)
    - concept of even/odd doesn't make sense for real floats

2.
is_odd?(7)
is_odd?(5.0)
is_odd?(-11)
is_odd?(-21.0)
is_odd?(0)
is_odd?(0.0)
is_odd?(222)
is_odd?(-8)
is_odd?(-10.0)
is_odd?(100.0)

4.
- Number is odd if modulo of number is 1

=end

def is_odd?(number)
  number % 2 == 1
end

puts is_odd?(7)
puts is_odd?(5.0)
puts is_odd?(-11)
puts is_odd?(-21.0)
puts is_odd?(0)
puts is_odd?(0.0)
puts is_odd?(222)
puts is_odd?(-8)
puts is_odd?(-10.0)
puts is_odd?(100.0)

##### Futher Exploration
# Rewriting method if I am not certain if % is modulo or remainder

def is_odd?(number)
  number.abs % 2 == 1
end

puts is_odd?(7)
puts is_odd?(5.0)
puts is_odd?(-11)
puts is_odd?(-21.0)
puts is_odd?(0)
puts is_odd?(0.0)
puts is_odd?(222)
puts is_odd?(-8)
puts is_odd?(-10.0)
puts is_odd?(100.0)

##### Further Exploration
# Using remainder instead of modulo

def is_odd?(number)
  number.remainder(2) != 0
end

puts is_odd?(7)
puts is_odd?(5.0)
puts is_odd?(-11)
puts is_odd?(-21.0)
puts is_odd?(0)
puts is_odd?(0.0)
puts is_odd?(222)
puts is_odd?(-8)
puts is_odd?(-10.0)
puts is_odd?(100.0)