=begin

1.
- input:
  - array of ANY elements (including nil)
- output: strings
  - car => 4
    truck => 3
    SUV => 1
    motorcycle => 2
  - we don't need to have a descending order based on the number of occurences

2.
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
array = [:car, 'car', 42, 'car', 'SUV', 1..4, 'truck', true, nil, 'car', 'truck', :car, [1, 2], {super: 555}]

3.
- we will use a hash to store the occurences of a certain value in the array
  - nil can be also used as a key

4.
- build a hash of key-value pairs
  - for each element in the array add the array value as a key to hash and set it to = 1
  - if key already exists, increase the value of the key by 1
- print each key-value pair to the screen with the corresponding class

=end

#vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
#count_occurrences(vehicles)


array = [:car, 'car', 42, 'car', 'SUV', 1..4, 'truck', true, nil, 'car', 'truck', :car, [1, 2], {super: 555}]

def count_occurrences(array)
  hash = {}
  array.each do |element|
    hash.has_key?(element) ? hash[element] += 1 : hash[element] = 1
  end
  hash.each do |key, value|
    key = "nil" if key == nil
    puts "#{key} => #{value} (#{key.class})"
  end
end

count_occurrences(array)
