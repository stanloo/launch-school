=begin

1.
- input:
  - asuume that there is no full stop and it's a clean string of words
- output:
  - words in the string in reverse order

2.
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

3.
- save words in the string as array to reverse the sorting

4.
- split the string into array of words
- reverse the order of array
- join the words in the array to a compound string

=end

def reverse_sentence(string)
  word_list = string.split.reverse!
  word_list.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'