# Exercise 1 / name.rb
puts "1)"
puts "Please type in your name, amigo."
name = gets.chomp
puts "Welcome to the matrix, #{name}!"
puts ""

# Exercise 2 / age.rb
puts "2)"
puts "How old are you?"
age = gets.chomp
puts "In 10 years you will be:"
puts age.to_i + 10
puts "In 20 years you will be:"
puts age.to_i + 20
puts "In 30 years you will be:"
puts 30 + age.to_i
puts "In 40 years you will be:"
puts 40 + age.to_i
puts ""

# Exercise 3
puts "3)"
10.times {puts name}
puts ""

# Exercise 4
puts "4)"
puts "Please type in your surname, amigo."
surname = gets.chomp
puts "Please type in your last name, hombre."
last_name = gets.chomp
puts "Welcome to the matrix, #{surname} #{last_name}!"
puts ""

# Exercise 5
puts "5)"
puts "In the first program the output is x = 3."
puts "In the second program there will be an error because x is defined in a local scope and cannot be accessed outside of it."
puts ""

# Exercise 6
puts "6)"
puts "The program tried to access a variable 'shoes' which is either not defined or defined outside of the scope of reference."
