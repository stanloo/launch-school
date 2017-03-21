def xor?(exp1, exp2)
  (exp1 && !exp2) || (!exp1 && exp2)
end

puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)

# a real xor operator would not perform short-circuit evaluation
# the xor-method in the example however does perform short-circuit valuation
### this is because in the example by proving that the left side is true...
### ... we automatically prove that the right side is wrong