# Forethoughts
=begin

1.
- input:
--- assume 2 positive integers

4.
- get input
- make output

=end

def prompt(message)
  puts "=> #{message}"
end

# My solution sucked, the following solution inspired by Nick Johnson
first, second = %w(first second).map do |number|
  prompt("Enter the #{number} number:")
  gets.chomp.to_f
end

%w(+ - * / % **).each do |operator|
  equation = "#{first} #{operator} #{second}"
  prompt("#{equation} = #{eval(equation) rescue "Can't divide through zero."}")
end