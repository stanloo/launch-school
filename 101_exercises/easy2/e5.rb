=begin

1.
- input:
  - assume a non empty string

2.
"Bob"
"Bob!"

4.
- get user name
- check if last character of name is an exclamation mark
  - chop it off if yes
- return corresponding string

=end


puts "What is your name?"
name = gets.chomp
if name[-1] == "!"
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
 puts "Hello, #{name}."
end

##### Further Exploration
# use chomp!

puts "What is your name?"
name = gets
name.chomp!
if name[-1] == "!"
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
 puts "Hello, #{name}."
end