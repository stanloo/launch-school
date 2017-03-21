def running_total(arr)
  total = 0
  arr.map { |x| total += x }
end

def running_total(array)
  sum = 0
  array.each_with_object([]) { |num, obj| obj << sum += num }
end

def running_total(array) # version 1
  sum = 0
  array.inject([]) do |obj, value|
    obj << sum += value
  end
end

def running_total(array) # version 2
  new_array = []
  array.inject(0) do |memo, value|
    memo += value
    new_array << memo
    memo
  end
  new_array
end

def running_total(array)
  new_array = []
  return array if array.empty?
  new_array << array.inject do |sum, n|
          new_array << sum
          sum + n
         end
  new_array
end

def running_total(array) # solition with Enumerator#with_index
  array.map.with_index do |_, index|
    array[0..index].inject(:+)
  end
end

def running_total(nums) ####### Nick Johnson.... look into it
  nums.reduce([]) { |result, n| result + [result.last.to_i + n] }
end
# First iteration:
# [].last.to_i == 0 ... nil.to_i == 0
# [] + [2] = [2]

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

def running_total(arr)
  (1..arr.size).map { |amount| arr.take(amount).reduce(:+) }
end
# .take returns new array with first i elements or array

arr = [2, 5, 13]
puts running_total(arr) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
p arr