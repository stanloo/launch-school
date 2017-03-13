=begin

1.
- input:
  - assume 2 positive floats or integers

2.
99 / 15

3.
- represent data as floats
- round the factor of bill and tip percentage to 2 decimal places

4.
- get input
- calculate and round tip
- display results

=end

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
per = gets.chomp.to_f
tip = (bill / 100 * per).round(2)
puts "The tip is $#{tip}"
puts "The total is $#{bill + tip}"

##### Further Exploration
# Formatting the output to 2 decimal places
=begin

2.
100 / 15

=end

puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", bill+tip)}"
