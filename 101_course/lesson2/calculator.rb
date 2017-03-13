# Walkthrough solution modified by me

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(key, var, var_name)
  if var
    MESSAGES[LANGUAGE][key] % { var_name.to_sym => var } # See line 50
  else
    MESSAGES[LANGUAGE][key]
  end
end

def prompt(key, var=nil, var_name=nil)
  message = messages(key, var, var_name)
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

# We can't use #{} in YAML, there is the following workaround however:
prompt('hello', name, 'name')
# We have to provide a variable and the variable name additionally (see line 9)
# We do that based on this example: https://launchschool.com/posts/c6b71114
# See also string method https://ruby-doc.org/core-2.2.0/String.html#method-i-25
# All in all, I feel like this is too much effort and we can use normal puts
### Especially if we would have more than 1 interpolated variables or...
### ... even a method with it's own arguments AS ARGUMENTS OF THE PROMPT

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

  puts "#{operation_to_message(operator)} the two numbers..."
  puts "The result is #{result}"

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