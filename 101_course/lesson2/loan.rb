# Forethoughts
=begin

1.
- input:
  - loan amount (we want a positive integer or float from user)
  - Annual Percentage Rate (APR) (we want a positive integer or float from user)
  - loan duration in months (we want a positive integer)

- output:
  - monthly interest rate (in percent)
  - loan duration in months
  - monthly payment

2.
a) 1000 / 1111.11 / -500 / 0 / hhh
b) 12 / 11.5 / -5 / 0 / 100 / hhh
c) -3 / 0 / 12 / 12.0 / hhh

4.
- get user input
  - check if inputs are valid
- calculate results

=end

# Definitions

messages = {
  welcome: 'Welcome to the car loan calculator.',
  prompt_loan_amount: 'Please input a valid loan amount.',
  invalid_number: 'This is not a valid number.',
  prompt_apr: 'Please input the APR (Annual Percentage Rate).',
  prompt_loan_duration: 'Please input the loan duration in months.'
}

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)
end

# Start program

prompt(messages[:welcome])

loan_amount = loop do
  prompt(messages[:prompt_loan_amount])
  input = gets.chomp
  if number?(input)
    break input.to_f
  else
    prompt(messages[:invalid_number])
  end
end

apr = loop do
  prompt(messages[:prompt_apr])
  input = gets.chomp
  if number?(input)
    break input.to_f
  else
    prompt(messages[:invalid_number])
  end
end

loan_duration_months = loop do
  prompt(messages[:prompt_loan_duration])
  input = gets.chomp
  if number?(input)
    break input.to_i
  else
    prompt(messages[:invalid_number])
  end
end

monthly_interest_rate = apr / 12
monthly_interest_rate_decimal = monthly_interest_rate / 100
prompt("Your monthly interest rate is #{monthly_interest_rate}%.")
prompt("Your loan duration is #{loan_duration_months} months.")
monthly_payment = loan_amount * monthly_interest_rate_decimal /
                  (1 - (1 + monthly_interest_rate_decimal)**-loan_duration_months)
prompt("Your monthly payment is #{monthly_payment}.")

# For $1000 and 12$ apr and duration of 12 months the monthly payment is $88
# That seems wrong but the example solution output is identical...
# ...so maybe a mistake in the provided formula (not my problem though!)

# Tests
do_test = false
if do_test
  puts number?('')
  puts number?('1000')
  puts number?('1111.11')
  puts number?('-500')
  puts number?('0')
  puts number?('001.10000')
  puts number?('hhh')
  puts number?('5z')
  puts number?(true)
end