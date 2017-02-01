# Exercise 1
puts "1)"
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
immediate_family = family.select do |rel, names|
  rel == :sisters || rel == :brothers
end
immediate_family_names = []
immediate_family.each do |rel, names|
  immediate_family_names << names
end
immediate_family_names.flatten!
p immediate_family_names
puts ""

# Exercise 1, my version without hash.select
puts "1) My version"
immediate_family = []
family.each do |rel, names|
  immediate_family << names if (rel == :sisters || rel == :brothers)
end
immediate_family.flatten!
p immediate_family
puts ""

# Exercise 2
puts "2)"
puts "The difference is: '.merge' doesn\'t mutate the caller. '.merge!' does."
fridge1 = { milk: 3, eggs: 10 }
fridge2 = { eggs: 2, tomatos: 5 }
inventory = fridge1.merge(fridge2) do |type, i1, i2|
  i1 + i2
end
p "Whole inventory: " + inventory.to_s
puts "Lets puts the contents of fridge2 into fridge1:"
fridge1.merge!(fridge2) do |type, i1, i2|
  i1 + i2
end
p "Contents of big fridge: " + fridge1.to_s
puts ""

# Exercise 3
puts "3)"
fridge1 = { milk: 3, eggs: 10 }
fridge1.each { |k, v| p k }
fridge1.each { |k, v| p v }
fridge1.each { |k, v| p "#{k}: #{v}" }
puts ""

# Exercise 4
puts "4)"
puts "With 'person[:name]'"
puts ""

# Exercise 5
puts "5)"
fridge1 = { milk: 3, eggs: 10 }
if fridge1.has_value?(10) then puts "Hash has value" else puts "NOOOT" end
puts ""

# Exercise 6
puts "6)"
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
while words != []
  comparable = words[0].chars.sort
  output = []
  words.each do |word|
    output << word if word.chars.sort == comparable
  end
  p output
  new_words = words.dup
  words.each do |word|
    new_words.delete(word) if output.include?(word)
  end
  words = new_words
end
puts ""

# Exercise 6, shorter code
puts "6) Shorter code..."
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
while words != []
  comparable = words[0].chars.sort
  output = []
  words.each do |word|
    output << word if word.chars.sort == comparable
  end
  p output
  words = words - output
end
puts ""

# Exercise 7
puts "7)"
puts "In the first hash the key is a symbol. In the second hash the key is a string."
puts ""

# Exercise 8
puts "8)"
puts "Answer B."
puts ""