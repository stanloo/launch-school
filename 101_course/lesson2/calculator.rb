# Walkthrough solution modified by me

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(key, subst)
  MESSAGES[LANGUAGE][key] % subst
end

def prompt(key, subst={})
  message = messages(key, subst)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# Start program

prompt('welcome')

name = loop do
  input = gets.chomp
  if input.empty?
    prompt('valid_name')
  else
    break input
  end
end

# We can't use #{} in YAML, there is the following workaround however with %{}:
prompt('hello', { name: name })
# We can also user multiple arguments in the hash
# We do that based on this example: https://launchschool.com/posts/c6b71114
# And based especially on the implementation of Ben Rodenhaeuser:
### https://launchschool.com/posts/aa22df1f
# See also string method https://ruby-doc.org/core-2.2.0/String.html#method-i-25

loop do
  number1 = loop do
    prompt('first_number')
    input = gets.chomp
    if valid_number?(input)
      break input
    else
      prompt('invalid_number')
    end
  end

  number2 = loop do
    prompt('second_number')
    input = gets.chomp
    if valid_number?(input)
      break input
    else
      prompt('invalid_number')
    end
  end

  prompt('operation')
  operator = loop do
    input = gets.chomp
    if %w(1 2 3).include?(input)
      break input
    elsif input == '4'
      number2 == '0' ? prompt('divide_through_zero') : (break input)
    else
      prompt('invalid_operation')
    end
  end

  case operator
  when '1'
    result = number1.to_i + number2.to_i
  when '2'
    result = number1.to_i - number2.to_i
  when '3'
    result = number1.to_i * number2.to_i
  when '4'
    result = number1.to_f / number2.to_f
  end

  operation = operation_to_message(operator)
  # We can't put "operation_to_message(operator)" in the next prompt,...
  # ... that's why we assign it to a variable
  prompt('operation_to_message', { operation: operation })
  prompt('result', { result: result })

  prompt('another_calculation')
  again = gets.chomp
  break if again.upcase != 'Y'
end

prompt('goodbye')


#####
# First way to check if input number is an integer
# Shortcoming: 000 converted to 0 => false
def valid_number?(number)
  number.to_i.to_s == number
end


#####
# Second way to check if input number is an integer
def integer?(input)
  Integer(input) rescue false
end
puts integer?("5")    # => 5
puts integer?("t5")   # => false


#####
# Third way to check if input number is an integer
# BUT with this method we can't input negative integers...
# Also their description about the method return is wrong...
# ... (we have to include the "? true : false")
def integer?(input)
  /^\d+$/.match(input) ? true : false
end
puts integer?("-5") # => false
puts integer?("5")  # => true


#####
# Allow integer and float inputs
def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
  # Shortcoming #1: 1.0000 converted to 1.0 => false
  # Shortcoming #2: 1. is converted to 1.0 => false
end
