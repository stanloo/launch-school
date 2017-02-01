# Exercise 1
puts "1)"
puts "1. false"
puts "2. false"
puts "3. false"
puts "4. true"
puts "5. true"
puts ""

# Exercise 2
puts "2)"
def big(string)
  string.upcase if string.length > 10 else string
end

puts big("Hallo Welt!")
puts big("Bob")
puts ""

# Exercise 3
puts "3)"
def number_input(number)
  begin
    number = Integer(number)
  rescue
    return "You didn't type a number"
  end
  if number > 100
    "Number is bigger than 100"
  elsif number > 50
    "Number is between 51 and 100"
  elsif number >= 0
    "Number is between 0 and 50"
  else
    "Number is lower than 0"
  end
end

puts "Please type in a number between 0 and 100"
puts number_input(gets.chomp)
puts ""

# Exercise 4
puts "4)"
puts "1. 'FALSE'"
puts "2. 'Did you get it right?'"
puts "3. 'Alright now!'"
puts ""

# Exercise 5
puts "5)"
def number_input(number)
  begin
    number = Integer(number)
  rescue
    return "You didn't type a number"
  end
  case
  when number > 100
    "Number is bigger than 100"
  when number > 50
    "Number is between 51 and 100"
  when number >= 0
    "Number is between 0 and 50"
  else
    "Number is lower than 0"
  end
end

puts "Please type in a number between 0 and 100"
puts number_input(gets.chomp)
puts ""

# Exercise 6
puts "6)"
puts "The error states that a keyword 'end' as expected. We didn't close the if conditional with 'end'."