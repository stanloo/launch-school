### Rock Paper Scissors (bonus features)

### Forethoughts
=begin
## Rules of the game
http://www.samkass.com/theories/RPSSL.html

## Data structure
- save decisions in a hash to be able to check if user input is "1"/"2"/"3"...
--- also, array would start at index 0 and we want to start at 1

# CHOICES
  '1' => 'rock',
  '2' => 'paper',
  '3' => 'scissors',
  '4' => 'spock',
  '5' => 'lizard'

# possible outcoms comparing hash key integer values
1-1 equal 0
1-2 lose -1 (odd, neg)
1-3 win -2 (even, neg)
1-4 lose -3
1-5 win -4
2-1 win 1
2-2 equal 0
2-3 lose -1
2-4 win -2
2-5 lose -3
...
5-1 lose 4 (even, pos)
5-2 win 3 (odd, pos)
5-3 lose 2
5-4 win 1
5-5 equal 0

# RULES
=> Index difference = 0 => equal always
=> Index difference > 0 && odd => WIN
=> Index difference > 0 && even => LOSE
=> Index difference < 0 && odd => LOSE
=> Index difference < 0 && even => WIN

## Algorithm
- get user choice
- randomly decide computer choice
- compare the 2 choices and make output
--- finish game if user or computer reaches 5 points
- ask if user wants to play again
--- reset point counter if yes
=end

CHOICES = {
  '1' => 'rock',
  '2' => 'paper',
  '3' => 'scissors',
  '4' => 'spock',
  '5' => 'lizard'
}
user_points = 0
computer_points = 0

def prompt(message)
  puts "=> #{message}"
end

def user_choice
  loop do
    input = gets.chomp
    if CHOICES.key?(input)
      break input.to_i
    else
      prompt('Not valid')
    end
  end
end

def computer_choice
  rand(1..5)
end

def outcome(user_int, computer_int)
  index_difference = user_int - computer_int
  if index_difference == 0
    "It's a tie."
  elsif index_difference > 0
    index_difference.odd? ? 'You win.' : 'You lose.'
  elsif index_difference < 0
    index_difference.odd? ? 'You lose.' : 'You win.'
  end
end

def display_results(user_int, computer_int, result)
  prompt("Your choice is #{CHOICES[user_int.to_s]}.")
  prompt("Computer chooses #{CHOICES[computer_int.to_s]}.")
  prompt(result)
end

def display_standing(user_points, computer_points)
  prompt("Standing: User #{user_points} : #{computer_points} Computer")
end

def display_final_standing(user_points, computer_points)
  prompt("Final Result: User #{user_points} : #{computer_points} Computer")
  if user_points > computer_points
    prompt("You've won the game! :)")
  else
    prompt("You've lost the game! :(")
  end
end

def continue_game?
  loop do
    input = gets.chomp.downcase
    case input
    when 'y' then break true
    when 'n' then break false
    else prompt('Not a valid command. Please type y/n.')
    end
  end
end

# Start program execution
loop do
  prompt("Let's play! Whoever reaches 5 points, wins. Good luck!")
  puts <<-MSG
    => Your choice:
    1 for rock
    2 for paper
    3 for scissors
    4 for spock
    5 for lizard
  MSG
  user_int = user_choice()
  computer_int = computer_choice()

  result = outcome(user_int, computer_int)
  display_results(user_int, computer_int, result)

  if result == 'You win.'
    user_points += 1
  elsif result == 'You lose.'
    computer_points += 1
  end

  if user_points == 5 || computer_points == 5
    display_final_standing(user_points, computer_points)
    user_points = 0
    computer_points = 0
    prompt('Want to play another game? y/n')
    if continue_game?()
      puts %x{clear}
    else
      break prompt('Thank you for playing!')
    end
  else
    display_standing(user_points, computer_points)
  end
end
