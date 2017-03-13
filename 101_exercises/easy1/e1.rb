=begin

1. Understanding the Problem
- input:
  - string + positive integer                                   # can be omitted
  - assume that the input is always valid
  - assume that the integer is of reasonable size (program executes within 1sec)
- output:
  - print string as many times as the integer indicates         # can be omitted

2. Examples / Test Cases
repeat('Hello', 3)                                              # can be omitted

3. Data Structure
- input data represented as it is                               # can be omitted

4. Algorithm / Abstraction
- method prints string x times

=end

def repeat(string, number)
  number.times { puts string }
end

repeat('Hello', 3)