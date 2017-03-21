def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end



puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# method will not work for prepending 0's because ruby reads it as octal number
puts palindromic_number?(0050) == true # => false
# solution: Kernel#sprintf, convert number to appropriate string first