=begin

1.
- input:
  - assume the input is always valid
- output:
  - array of number figures

2.
digit_list(12345) == [1, 2, 3, 4, 5]
digit_list(7) == [7]
digit_list(375290) == [3, 7, 5, 2, 9, 0]
digit_list(444) == [4, 4, 4]

3.
- convert number to string to get number figures

4.
- split the string into an array
- turn every array element into an integer again (by mapping array)

=end

def digit_list(number)
  arr = number.to_s.split("")
  arr.map { |x| x.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

# I don't like the approach of getting the numbers via math operations in this exercise (e.g. 375290 / 100000 = 3)
# Reason: We don't care in this exercise about calculations at all, so just use strings



##### Sample Solution
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]