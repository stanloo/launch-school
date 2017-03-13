# Rock Paper Scissors (my initial solution)

# Forethoughts
=begin

1. Understanding the problem
- input:
--- user choice (string)
- output:
--- string who won!

2. Test cases
- same choice
- one choice beats the other
- multidimensional (> 3 choices) -> choices that don't relate to each other

3. Data structure
- save decisions in a hash to be able to check if user input is "1"/"2"/"3"...
--- also, array would start at index 0 and we want to start at 1

# possible outcoms comparing hash key integer values
1-1 equal 0
1-2 lose -1
1-3 win -2
2-1 win 1
2-2 equal 0
2-3 lose -1
3-1 lose 2
3-2 win 1
3-3 equal 0
=> Index difference = 0 => equal always
=> Index difference = 1 => win always
=> Index difference = -1 => lose always
=> Index difference = 2 / -2 => 2 special cases, depend on size of hash
===> value here is always +/- (hash.size - 1)
=> Potential size of hash > 3 => e.g. 4: can't compare choices 1 and 3 together
===> adress a message for that

4. Algorithm
- get user choice
- randomly decide computer choice
- compare the 2 choices and make output
--- create a message for when there is more than 3 choices
- ask if user wants to play again

=end

CHOICES = {
  '1' => 'rock',
  '2' => 'paper',
  '3' => 'scissors',
  '4' => 'well'
}

def prompt(message)
  puts "=> #{message}"
end

def get_user_choice()
  loop do
    input = gets.chomp
    if CHOICES.key?(input)
      then break input.to_i
    else
      prompt('Not valid')
    end
  end
end

def get_computer_choice()
  rand(1..CHOICES.size)
end

def outcome(user_int, computer_int)
  index_difference = user_int - computer_int
  case index_difference
  when 0
    "It's a tie."
  when 1
    'You win.'
  when -1
    'You lose.'
  when -(CHOICES.size - 1)
    'You win.'
  when CHOICES.size - 1
    'You lose.'
  else
    "It's a tie. Commands have no relation to each other."
  end
end

def display_results(user_int, computer_int)
  prompt("Your choice is #{CHOICES[user_int.to_s]}.")
  prompt("Computer chooses #{CHOICES[computer_int.to_s]}.")
  result = outcome(user_int, computer_int)
  prompt(result)
end

def continue_game?()
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
  puts <<-MSG
    => Your choice:
    1 for rock
    2 for paper
    3 for scissors
    4 for well
  MSG
  user_int = get_user_choice()
  
  computer_int = get_computer_choice()
  display_results(user_int, computer_int)
  
  prompt('Want to play another game? y/n')
  continue_game = continue_game?()
  break unless continue_game
end