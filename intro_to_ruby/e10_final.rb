# Exercise 1
puts "1)"
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |x| p x }
puts ""

# Exercise 2
puts "2)"
arr.each { |x| p x if x > 5 }
puts ""

# Exercise 3
puts "3)"
odd = arr.select { |x| x.odd? }
p odd
puts ""

# Exercise 4
puts "4)"
arr << 11
arr.unshift(0)
p arr
puts ""

# Exercise 5
puts "5)"
arr.pop
arr.push(3)
p arr
puts ""

# Exercise 6
puts "6)"
arr.uniq!
p arr
puts ""

# Exercise 7
puts "7)"
puts "Array is an ordered list, elements can be accessed via index. Hash elements are not in a particular order, values can be accessed by the corresponding key."
puts ""

# Exercise 8
puts "8)"
hs1 = {key1: 23, key2: 43}
hs2 = {"house" => "big", "car" => "nice"}
hs3 = Hash.new()
hs3[:monster] = 666
p hs1
p hs2
p hs3
puts ""

# Exercise 9
puts "9)"
h = {a: 1, b: 2, c: 3, d: 4}
p h[:b]
h[:e] = 5
p h
p h.select { |k, v| v >= 3.5 }
puts "or"
h.delete_if { |k, v| v < 3.5 }
p h
puts ""

# Exercise 10
puts "10)"
puts "yes"
hash = {k1: arr, k2: odd}
p hash
array = [hs1, hs2]
p array
puts ""

# Exercise 11
puts "11)"
puts "Standard API of Ruby (https://ruby-doc.org/) because I worked with it and it is ok. Haven't worked with Rails yet so no answer here. "
puts ""

# Exercise 12
puts "12)"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
p contacts
puts ""

# Exercise 13
puts "13)"
p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]
puts ""

# Exercise 14
puts "14)"

puts "Single-entry version:"
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
sym = [:email, :address, :phone]
sym.each do |x|
  contacts["Joe Smith"][x] = contact_data[0]
  contact_data.shift
end
p contacts

puts "And here the multi-entry version:"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts.keys.each do |name|
  sym.each do |property|
    contacts[name][property] = contact_data[0][0]
    contact_data[0].shift
  end
  contact_data.shift
end
p contacts

puts "Sample solution:"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contacts.each_with_index do |(name, hash), i|
  sym.each do |property|
    hash[property] = contact_data[i].shift
  end
end
p contacts
puts ""

# Exercise 15
puts "15)"
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |v| v.start_with?("s") || v.start_with?("w") }
p arr
puts ""

# Exercise 16
puts "16)"
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
b = a.map { |x| x.split(" ") }
b.flatten!
p b
puts ""

# Exercise 17
puts "17)"
puts "Hashes are the same."
puts ""