# Forethoughts
=begin

1.
- input:
--- number can be a positive or negative integer or float (including zero)
--- assume power a positive or negative integer (including zero)

2.
puts expo(5.2, 3)
puts expo(5, -2)
puts expo(5, 0)
puts expo(1, 3)
puts expo(-3, -2)

4.
- account for negative exponents (use absolute number for power-1)
- power-1 times call multiply()
--- pass it the result of previous as first arg
--- pass it original number as second arg
- special case for exponent = 0

=end

def multiply(a, b)
  a * b
end

def expo(number, n)
  result = 1
  (n.abs).times { result = multiply(result, number) }
  result = 1 / result.to_f if n < 0
  result
end

puts expo(5.2, 3)
puts expo(5, -2)
puts expo(5, 0)
puts expo(1, 3)
puts expo(-3, -2)