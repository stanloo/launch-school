=begin

1.
- input:
  - no input
- output:
  - Teddy is 20-200 years old!

2.
puts terry_age()

4.
- Generate a random number between 20 and 200 and print string

=end

def terry_age()
  "Teddy is #{rand(20..200)} years old!"
end


puts terry_age()
puts terry_age()
puts terry_age()


##### Further Exploration
# User can input name

def some_age(string)
  string = "Teddy" if string == ""
  "#{string} is #{rand(20..200)} years old!"
end


puts some_age(gets.chomp)