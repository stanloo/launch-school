def oddities(array)
  new_array = []
  array.each_with_index { |x, i| new_array << array[i] if i.even? }
  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities(array)
  i = 0
  new_array = []
  while i < array.size
    new_array << array[i]
    i += 2
  end
  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities(array)
  new_array = []
  (0...array.size).step(2) { |i| new_array << array[i] }
  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities(array)
  array.select { |x| array.index(x).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities(arr)
  arr.select.with_index { |el, i| i.even? } # with_index Enumerator method
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []