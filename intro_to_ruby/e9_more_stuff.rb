# Exercise 1
puts "1)"
words = [
    "laboratory",
    "experiment",
    "Pans Labyrinth",
    "elaborate",
    "polar bear"
    ]
words.each do |x|
  if x =~ /lab/ then puts x end
end
puts ""

# Exercise 2
puts "2)"
puts "Nothing is printed because you have to activate block with block.call. The return is a Proc object."
puts ""

# Exercise 3
puts "3)"
puts "Exception Handling is a process to deal with exceptions in a regulated way. It solves the problem that exceptions would cause the execution come to a halt by throwing out a message instead and continue with the execution flow."
puts ""

# Exercise 4
puts "4)"
def execute(&block)
  block.call
end
execute { puts "Hello from inside the execute method!" }
puts ""

# Exercise 5
puts "5)"
puts "The method is expecting a variable and not a block as an argument."
puts ""