### Question 1
# arr.uniq does not mutate the caller, output is still the original array

### Question 2
# ! and ? at the end of method names are part of the name
## ! usually signals that arguments or the reciever is mutated (convention)
## ? usually signals that a boolean value is returned (convention)
# ? is also being used in the syntax of the ternary operator (exp ? ... : ...)
# 1. != is the 'not equal operator' and is used in comparisons
# 2. ! is the 'not operator' and it turns a boolean value into the opposite
# 3. method! usually signals a destructive method changing it's arguments
# 4. SyntaxError
# 5. As part of a method name OR...
# ... in returning single characters strings like this '?a' => 'a'
# 6. !! prepending a variable turns it's value into a boolean equivalent

### Question 3
advice =
"Few things in life are as important as house training your pet dinosaur."
advice.gsub!(/important/, 'urgent')  
puts advice

### Question 4
# numbers.delete_at(1) -> deletes value at index 1
# numbers.delete(1) -> deletes all entries with the value specified

### Question 5
puts (10..100).include?(42)

### Question 6
famous_words = "seven years ago..."
puts 'Four score and ' + famous_words
puts "Four score and #{famous_words}"

### Question 7
# 42

### Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!
puts flintstones.inspect

### Question 9
flintstones = { 
  "Fred" => 0,
  "Wilma" => 1,
  "Barney" => 2,
  "Betty" => 3,
  "BamBam" => 4,
  "Pebbles" => 5
}
puts flintstones.assoc("Barney").inspect