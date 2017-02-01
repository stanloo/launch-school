# Exercise 1
puts "1) Stanislaw" + "Lorenz"
puts ""

# Exercise 2
puts "2) We have the number 5678"
puts "thousands: " + (5678 / 1000).to_s
puts "hundreds: " + (5678 / 100 % 10).to_s
puts "tens: " + (5678 % 100 / 10).to_s
puts "ones: " + (5678 % 10).to_s
puts ""

# Exercise 3
puts "3)"
films = {:titanic => 1997, :scarface => 1984, :avatar => 2008}
puts films[:titanic]
puts films[:scarface]
puts films[:avatar]
puts ""

# Exercise 4
puts "4)"
years = [films[:titanic], films[:scarface], films[:avatar]]
puts years
puts ""

# Exercise 5
puts "5)"
puts "Factorial of 5: " + (5 * 4 * 3 * 2 * 1).to_s
puts "Factorial of 6: " + (6 * 5 * 4 * 3 * 2 * 1).to_s
puts "Factorial of 7: " + (7 * 6 * 5 * 4 * 3 * 2 * 1).to_s
puts "Factorial of 8: " + (8 * 7 * 6 * 5 * 4 * 3 * 2 * 1).to_s
puts ""

# Exercise 6
puts "6) "
puts "The square of 10.2 is " + (10.2 * 10.2).to_s
puts "The square of 5.55 is " + (5.55 * 5.55).to_s
puts "The square of 0.11 is " + (0.11 * 0.11).to_s
puts ""

# Exercise 7
puts "7) "
puts "There is a closing parentheses on line 16 in the code but the compiler expected a closing curly bracket."
puts "That means an opened curly bracket was not closed."
