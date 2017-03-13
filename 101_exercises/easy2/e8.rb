=begin

1.
- input:
  - number input can be anything
  - command input can be anything
- output:
  - either sum of integers between 1 and number
  - or product of integers between 1 and number

2.
5 / "s"
5 / "p"
5 / "hhh"

4.
- get input
- check if command is valid
  - if yes, print corresponding result
  - if not, print failure notification

=end

puts ">> Please enter an integer greater than 0:"
num = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp
sum = (1..num).reduce(:+)
product = (1..num).reduce(:*)
case operation
when "s" then puts "The sum of the integers between 1 and #{num} is #{sum}."
when "p" then puts "The product of the integers between 1 and #{num} is #{product}."
else puts "Invalid operation"
end

##### My alternative
# Checking if number input is a valid integer

puts ">> Please enter an integer greater than 0:"
num_string = gets.chomp
num = num_string.to_i
if num.to_s != num_string
  puts "Invalid input"
elsif num < 1
  puts "Integer has to be greater than 0"
else
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  sum = (1..num).reduce(:+)
  product = (1..num).reduce(:*)
  case operation
  when "s" then puts "The sum of the integers between 1 and #{num} is #{sum}."
  when "p" then puts "The product of the integers between 1 and #{num} is #{product}."
  else puts "Invalid operation"
  end
end