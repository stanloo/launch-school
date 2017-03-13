=begin

1.
- input:
  - asuume that there is no full stop and it's a clean string of one or more words
- output:
  - reverse the order of letters in words with 5 or more letters
  - Spaces should be included only when more than one word is present

2.
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

3.
- save words in the string as array

4.
- split the string into array of words
- reverse the order of letters for each word in array
- join the words in the array to a compound string

=end

def reverse_words(string)
  word_list = string.split.each { |word| word.reverse! if word.length > 4 }
  word_list.join(" ")
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')