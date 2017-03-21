# Forethoughts
=begin

4.
- string.downcase
- array with alphanumeric values
- delete every char that is not am element in the array
- compare str and str.reverse

=end



def real_palindrome?(str)
  str.downcase!
  arr = [*'0'..'9', *'a'..'z']
  str = str.chars.select { |x| arr.include?(x) }
  str == str.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false