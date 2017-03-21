# Forethoughts
=begin

1.
- input:
--- 5 strings, assume they are integers (but it doesn't really matter)
--- 6th is a number, assume input is an integer

2.
- last number is in array
- last number is not in array

3.
- save first 5 inputs in array as strings

4.
- get user input
--- push input to array for 6 times
- pop last item out of the array
- check if array includes popped item

=end

def prompt(message)
  puts "=> #{message}"
end

counter = %w(1st 2nd 3rd 4th 5th 6th)
input_list = []

loop do
  prompt("Enter the #{counter[input_list.size]} number:")
  input_list << gets.chomp
  break if input_list.size == 6
end
number = input_list.pop

if input_list.include?(number)
  prompt("The number #{number} appears in #{input_list}.")
else
  prompt("The number #{number} does not appear in #{input_list}.")
end