# Forethoughts
=begin

1.
- input:
--- can be anything

4.
- split the string and then join it (remove whitespace)
- return string size

=end

def prompt(message)
  puts "=> #{message}"
end

prompt('Please write word or multiple words:')
sentence = gets.chomp
number = sentence.split.join.size
prompt("There are #{number} characters in '#{sentence}''.")
