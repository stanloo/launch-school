# Exercise 1
puts "1)"
def greeting(name)
  "Hello, #{name}!"
end

puts greeting("Roger")
puts ""

# Exercise 2
puts "2)"
puts "1. 2"
puts "2. nil"
puts "3. 'Joe'"
puts "4. 'four'"
puts "5. nil"
puts ""

# Exercise 3
puts "3)"
def multiply(a, b)
  a * b
end

puts multiply(4, 5)
puts ""

# Exercise 4
puts "4)"
puts "It won't print anything because the puts command in the method is never reached."
puts ""

# Exercise 5
puts "5)"
def scream(words)
  words = words + "!!!!"
  puts words
end

puts "1."
scream("Yippee")
puts "2. It returns nil."
puts ""

# Exercise 6
puts "6)"
puts "The method 'calculate_products' expected 2 arguments but only 1 argument was passed to it."
