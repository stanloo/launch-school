# Question 1
str = 'The Flintstones Rock!'
10.times { |i| puts str.rjust(str.size+i) }

# Question 2
# No implicit conversion of integer to string
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3
# number % dividend == 0 -> we want to see if number can be divided through...
# ... dividend and yield integer... and only then add the quotient to the array
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors # Returning the array, else nil would be returned (while-loop!)
end

p factors(56)
p factors(0)
p factors(-56)

# Question 4
# Difference: in first method the buffer array is mutated within method...
# ... in the second method he is not
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
buffer = [5,6]
p rolling_buffer1(buffer, 3, 7)
p buffer
input_array = [5,6]
p rolling_buffer2(input_array, 3, 7)
p input_array

# Question 5
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 7
# 34

# Question 8
# Yes, the munsters hash is altered within the method
# Reason: munster is a mutable object, and we mutate it's elements...
# ... via the help of the copy of reference to the underlying object

# Question 9
# paper

# Question 10
# no