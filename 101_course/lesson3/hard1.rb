# Question 1
# local variable greeting will be initialized to nil

# Question 2
# The output is {:a=>"hi there"}
# informal_greeting references the object IN the hash
# << is a mutating operation performed  oninformal_greeting
# the underlying object is altered

# Question 3
# A) one/two/three
# B) one/two/three
# C) two/three/one

# Question 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    break false unless is_an_ip_number?(word)
  end
  true
end