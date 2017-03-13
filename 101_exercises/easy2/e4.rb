=begin

1.
- input:
  - assume 2 reasonable integers

2.
18 / 65

3.
- age saved as integers

4.
- get input
- display output

=end

puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire = gets.chomp.to_i

puts "It's #{Time.new.year}. You will retire in #{Time.new.year + retire - age}."
puts "You have only #{retire - age} years of work to go!"