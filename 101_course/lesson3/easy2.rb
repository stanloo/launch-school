### Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.key?("Spot")
puts ages.has_key?("Spot")
puts !ages["Spot"].nil?

### Question 2
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

### Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
additional_ages.each { |key, value| ages[key] = value }
p ages

### Question 4
advice =
"Few things in life are as important as house training your pet dinosaur."
puts advice.include?('Dino') # For many words better use array, see next...
puts !advice.split.select { |x| x.include?('Dino') }.empty?
puts advice.match('Dino').inspect

### Question 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.inspect

### Question 6
flintstones << 'Dino'

### Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))

### Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0...advice.index('house'))
puts advice
# using str.slice would leave the advice string non-mutated

### Question 9
statement = "The Flintstones Rock!"
puts statement.chars.count('t')

### Question 10
title = "Flintstone Family Members"
puts title.center(40)