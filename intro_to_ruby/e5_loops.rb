# Exercise 1
puts "1)"
puts "The each method returns the original array. The result of the block is discarded."
puts ""

# Exercise 2
puts "2)"
loop do
  puts "Please type in a command."
  x = gets.chomp
  puts "Your command is #{x}"
  break if x == "STOP"
end
puts ""

# Exercise 3
puts "3)"
arr = [1, "mouse", :mango]
arr.each_with_index do |item, index|
  puts "#{index} -> #{item}"
end
puts ""

# Exercise 4
puts "4)"
def count(par)
  puts par
  return if par <= 0
  count(par - 1)
end
count(6)
count(-4)
puts ""