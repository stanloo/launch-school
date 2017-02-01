# Exercise 1
puts "1)"
arr = [1, 3, 5, 7, 9, 11]
number = 3
def check(array, number)
  if array.include?(number) then puts "Array includes number" else "Array does not include number" end
end
check(arr, number)
puts ""

# Exercise 2
puts "2)"
puts "1. Return is '1'"
puts 'Array is \'[["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]\''
puts "2. Return is '[1, 2, 3]'"
puts 'Array is \'[["b"], ["a", [1, 2, 3]]]\''
puts ""

# Exercise 3
puts "3)"
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr[1][0]
puts ""

# Exercise 4
puts "4)"
puts "1. '3'"
puts "2. 'Error'"
puts "3. '8'"
puts ""

# Exercise 5
puts "5)"
puts "1. 'e'"
puts "2. 'A'"
puts "3. 'nil'"
puts ""

# Exercise 6
puts "6)"
puts "You try to get a value by its value and not by its index."
puts "Use 'names[3] = 'jody'' or names[names.index('margaret')] = 'jody'"
puts ""

# Exercise 7
puts "7)"
arr = [1, 2, 3, 4]
arr_new = arr.map { |x| x + 2 }
p arr
p arr_new
puts ""