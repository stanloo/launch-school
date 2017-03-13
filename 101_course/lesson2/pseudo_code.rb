# a method that returns the sum of two integers
# a method that takes an array of strings, and returns a string that is all those strings concatenated together

=begin

#####
# Sample pseudo code
Given a collection of integers.
Iterate through the collection one by one.
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it's the same
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value
After iterating through the collection, return the saved value.

1a)
Given 2 integers.
Add the 2 integers to a sum.
Return the sum.

1b)
Given an array of strings.
Iterate through the array one by one.
  - for each iteration, add the current value to a string variable.
After iterating through the array, return the string variable.

#####
# Sample formal pseudo code
START
# Given a collection of integers called "numbers"
SET iterator = 1
SET saved_number = value within numbers collection at space 1
WHILE iterator < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number
  iterator = iterator + 1
PRINT saved_number
END

2a)
START
# Given 2 integers called "num1" and "num2"
SET sum = num1 + num2
READ sum
END

2b)
START
# Given an array of strings caled "arr"
SET iterator = 1
SET string = ""
WHILE iterator < length of "arr"
  SET string = string + current value
  SET iterator = iterator + 1
READ string
END

=end