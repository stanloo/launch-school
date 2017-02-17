require "pry"

=begin

# 7. Exercise: 99 Bottles of Beer on the Wall
bottles_amount = 5
while bottles_amount >= 2
  puts "#{bottles_amount} bottles of beer on the wall, #{bottles_amount} bottles of beer."
  bottles_amount -= 1
  puts "Take one down and pass it around, #{bottles_amount} bottles of beer on the wall."
end
puts "1 bottle of beer on the wall, 1 bottle of beer."
puts "Take one down and pass it around, no more bottles of beer on the wall."
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 5 bottles of beer on the wall."


# 7. Exercise: Deaf grandma extended
bye = 0
puts "say smt nice to grandma"
loop do
  sentence_to_grandma = gets.chomp
  if sentence_to_grandma == "BYE"
    puts "HUH?! SPEAK UP, SONNY!"
    bye += 1
    break if bye == 3
  elsif sentence_to_grandma == sentence_to_grandma.upcase
    bye = 0
    puts "NO, NOT SINCE #{1930 + rand(21)}!"
  else
    bye = 0
    puts "HUH?! SPEAK UP, SONNY!"
  end
end


# 7. Exercise: Leap years
puts "first year?"
first_year = gets.chomp.to_i
puts "second year?"
second_year = gets.chomp.to_i
puts "Here come all the leap years between #{first_year} and #{second_year}"
while second_year >= first_year
  if (second_year % 4 == 0) && (second_year % 100 != 0 || second_year % 400 == 0)
    puts second_year
  end
second_year -= 1
end


# 8. Exercise: Building and sorting an array
puts "write words now"
arr = []
while (word = gets.chomp) != ""
  arr.push(word)
end
puts arr.sort


# 8. Exercise: Table of contents, revisited
contents = [  ["1", "Getting Started", "1"],
              ["2", "Numbers", "9"],
              ["3", "Letters", "13"]
            ]
puts "Table of Contents".center(50)
contents.each do |chapter|
  puts "Chapter #{chapter[0]}:  " + chapter[1].ljust(20) + "page" + chapter[2].rjust(2)
end


# 9. Exercise: Improved ask method
def ask(question)
  while true
    puts question
    reply = gets.chomp.downcase
    if reply == 'yes'
      return true
    elsif reply == 'no'
      return false
    end
    puts 'Please answer "yes" or "no".'
  end
end
ask('Do you like eating burritos?')
wets_bed = ask('Do you wet the bed?')
puts wets_bed


# 9. Exercise: Old-school Roman numerals & “Modern” Roman numerals
puts "please input a number between 0 and 9999"
number = gets.chomp.to_i
def to_roman_old (number)
  first       = number / 1000
  second      = number / 100  % 10
  third       = number / 10   % 10
  fourth      = number        % 10
  raw_nums    = [second, third, fourth]
  literals = [["D", "C"], ["L", "X"], ["V", "I"]]
  old_roman_number = "M" * first
  new_roman_number = "M" * first
  raw_nums.each_with_index do |num, i|
    if num == 9 && i == 0
      new_roman_number << "CM"
    elsif num == 9
      new_roman_number << literals[i][1] + literals[i-1][1]
    elsif num > 4
      new_roman_number << literals[i][0] + literals[i][1] * (num - 5)
    else
      new_roman_number << literals[i][1] * num
    end
    if num > 4
      old_roman_number << literals[i][0] + literals[i][1] * (num - 5)
    else
      old_roman_number << literals[i][1] * num
    end
  end
  puts old_roman_number
  puts new_roman_number
end
to_roman_old(number)


# 9. Sample solution: “Modern” Roman numerals
# Chris Pine made a mistake though! He thought that 1999 -> MIM but in reality 1999 -> MCMXCIX
def roman_numeral num
  raise 'Must use positive integer' if num <= 0
  digit_vals = [['I', 5, 1],
                ['V', 10, 5],
                ['X', 50, 10],
                ['L', 100, 50],
                ['C', 500, 100],
                ['D', 1000, 500],
                ['M', nil, 1000]]
  roman = ''
  remaining = nil
  build_rev = proc do |l,m,n|
    num_l = m ? (num % m / n) : (num / n)
    full = m && (num_l == (m/n - 1))
    if full && (num_l > 1 || remaining)
      # must carry
      remaining ||= l # carry l if not already carrying
    else
      if remaining
        roman << l + remaining
        remaining = nil
      end
      roman << l * num_l
    end
  end
  digit_vals.each {|l,m,n| build_rev[l,m,n]}
  roman.reverse
end
puts(roman_numeral(1999))


# 10. Example: Building a world
M = 'land'
o = 'water'
world = [ [o,o,o,o,o,o,o,o,o,o,o],
          [o,o,o,o,M,M,o,o,o,o,o],
          [o,o,o,o,o,o,o,o,M,M,o],
          [o,o,o,M,o,o,o,o,o,M,o],
          [o,o,o,M,o,M,M,o,o,o,o],
          [o,o,o,o,M,M,M,M,o,o,o],
          [o,o,o,M,o,o,M,M,M,M,M],
          [o,o,o,M,M,o,M,M,M,M,M],
          [o,o,o,o,o,o,M,M,M,o,o],
          [o,M,o,o,o,M,o,o,o,o,o],
          [o,o,o,o,o,o,o,o,o,o,o]]
def continent_size (world, x, y)
  if world[y][x] != 'land'
    return 0
  end
size = 1
  world[y][x] = 'counted land'
  arr = [x, x-1, x+1].product([y, y-1, y+1])
  arr.delete([x, y])
  arr.each { |a, b| size += continent_size(world, a, b) }
  size
end
puts continent_size(world, 5, 5)


# 10. In-text-exercise: Sorting
# This is a program to sort an array of strings WITH recursion
words = ["rand4", "Banana1", "bimbo3", "size5", "World2", "English", "words", "Polski", "Żurek", "crème", "fraîche"]
# My recursion program runs like this:
# met1(arr.length=5) -> met1(=4) -> met1(=3) -> met1(=2) => *mark 1*
# mark 1 -> met1(=3) -> met1(=4) -> met1(=5) => final return
def sort(array_of_words, ordered_list=[])
  ul = array_of_words.dup
  runner = ul[0]
  ul.each_with_index do |word, i|
    if ul.length == 1
      ordered_list << word
      # "return ordered_list" here is not neccesary (it would return me to the inner method met1(=3) on *mark1*)
      # Reason: the value of "ordered_list" has been MUTATED** and will be available in the outer methods (until the place it was defined) (*)
      # "ordered_list" had been defined in the outmost method met1(arr.length=5)
      # That means, that from there we can simply return the value of "ordered_list" to the main execution flow.
      #
      # The only thing we need to do here is break out of the loop / most inner method (and then loop back)
      # We can either do this via "break" (which will only put us out of the .each method) or return (which puts us out of met1(=2))
      # "break": after we are out of .each there are still some line to evaluate in met1(=2) before it starts to loop back
      # This is not critical because we really DON'T care what return will be passed along looping back (because *)
      # But "return" saves a few line of computing power so I choose it (it returns to the inner method met1(=3) (*mark 1*))
      #
      # MUTATED: See an easy example where you mutate a variable within a method and it stays mutated without the need to return it! (**)
      return
    end
    if runner > ul[i+1] then runner = ul[i+1] end
    if i == ul.length - 2
      ordered_list << runner
      ul.delete_at(ul.index(runner))
      sort(ul, ordered_list) # *mark1*: Above "return" goes here
      # We can not return to global scope immediately, we have to exit every inner method (that we got into) first
      return ordered_list #(***)
      # The above return serves two purposes
      # 1) Speeding up the process of looping back (we don't care about the returned value until the very outmost method)
      # 2) Returning the searched value from the outmost method into the main execution flow
      #
      # If we wouldn't include "return" here and only here (****) it would still work (return would be "ordered_list" always)
      # Reason: After .each is finished, the line **** will be executed before looping one method up
      #
      # Sidenote: If we would not include "return" at *** nor ****, than the value returned to all outer methods would be the X of X.each
      # The last line evaluated in a method with an x.each statement happens to be just the x before the .each
      # This surprises me, but seems to be a Ruby feature
    end
  end
  # binding.pry
  # return ordered_list #(****)
  # The return here has the purpose to return the searched value from the most outer method
  # This statement is reached only once, after the whole looping, reason is that the *** return causes the loop-back without ever reaching ****
end
a = sort(words)
p a
p words


# 10. In-text-exercise: Sorting
# This is a program so sort an array of strings WITHOUT recursion
words = ["rand4", "Banana1", "bimbo3", "size5", "World2", "English", "rand4", "Polski", "Żurek", "crème", "fraîche", "rand3"]
def sortx(array_of_words)
  sorted=[]
  unsorted = array_of_words.dup
  while unsorted.length > 1
    compare(unsorted, sorted)
  end
  sorted << unsorted[0]
  return sorted
end
def compare(old_array, new_array)
  runner = old_array[0]
  old_array.each_with_index do |word, i|
    if runner > old_array[i+1] then runner = old_array[i+1] end
    if i == old_array.length - 2
      new_array << runner
      old_array.delete_at(old_array.index(runner))
      return new_array
    end
  end
end
ordered_words = sortx(words)
p ordered_words
p words

# 10. Exercise: Shuffle
# Program to shuffle an ordered array of strings (refers the above sorting program "sortx")
# Refers to ordered_words from 10. In-text-exercise: Sorting
def shuffle(array_of_words)
  shuffled=[]
  old_array = array_of_words.dup
  while old_array.length > 0
    i = rand(old_array.length)
    shuffled << old_array[i]
    old_array.delete_at(i)
  end
  return shuffled
end
shuffled_words = shuffle(ordered_words)
p shuffled_words
p ordered_words


# 10. Exercise: Dictionary sort
# Shuffle example solution
def shuffle(arr)
  arr.sort_by! { |x| x = rand }
end
p shuffle([1,2,3,4,5,6,7,8,9])


# 10. Exercise: Expanded english_number
def english_number(number, counter=0)
  if number < 0 # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end
  num_string = '' # This is the string we will return.
  ones_place = ['one', 'two', 'three',
                'four', 'five', 'six',
                'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty',
                'forty', 'fifty', 'sixty',
                'seventy', 'eighty', 'ninety']
  teenagers = ['eleven', 'twelve', 'thirteen',
                'fourteen', 'fifteen', 'sixteen',
                'seventeen', 'eighteen', 'nineteen']
  arr = [" thousand", " million", " billion", " trillion", " quadrillion", " quintillion"]
  left = number
  
  write = left/1000 # How many hundreds left?
  left = left - write*1000 # Subtract off those hundreds.
  if write > 0
    counter += 1
    more = english_number(write, counter)
    num_string = num_string + more
    num_string += arr[counter-1] if !more.end_with?("ion")
    counter -= 1
    if left > 0
      # So we don't write 'two hundredfifty-one'...
      num_string = num_string + ' '
    end
  end
  
  write = left/100 # How many hundreds left?
  left = left - write*100 # Subtract off those hundreds.
  if write > 0
    # hundreds = english_number(write, counter)
    num_string = num_string + ones_place[write-1] + ' hundred'
    if left > 0
      # So we don't write 'two hundredfifty-one'...
      num_string = num_string + ' '
    end
  end
  
  write = left/10 # How many tens left?
  left = left - write*10 # Subtract off those tens.
  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of
      # "twelve", we have to make a special exception
      # for these.
      num_string = num_string + teenagers[left-1]
      # The "-1" is because teenagers[3] is
      # 'fourteen', not 'thirteen'.
      # Since we took care of the digit in the
      # ones place already, we have nothing left to write.
      left = 0
    else
      num_string = num_string + tens_place[write-1]
      # The "-1" is because tens_place[3] is
      # 'forty', not 'thirty'.
    end
    
    if left > 0
      # So we don't write 'sixtyfour'...
      num_string = num_string + '-'
    end
  end
  write = left # How many ones left to write out?
  left = 0 # Subtract off those ones.
  if write > 0
    num_string = num_string + ones_place[write-1]
    # The "-1" is because ones_place[3] is
    # 'four', not 'three'.
  end
  num_string
end
puts english_number(57009)
puts english_number(999999)
puts english_number(1000000)
puts english_number(1000001)
puts english_number(1019901)
puts english_number(1000000000000)
puts english_number(11000123000055)
puts english_number(2345611000123000055)

# 10. Exercise: Ninety-nine Bottles of Beer on the Wall.
# bottles of beer program rewritten referring to the above english-numbers program
bottles_amount = 99
while bottles_amount >= 2
  puts "#{english_number(bottles_amount).capitalize} bottles of beer on the wall, #{english_number(bottles_amount)} bottles of beer."
  bottles_amount -= 1
  puts "Take one down and pass it around, #{english_number(bottles_amount)} bottles of beer on the wall."
end
puts "1 bottle of beer on the wall, 1 bottle of beer."
puts "Take one down and pass it around, no more bottles of beer on the wall."
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 5 bottles of beer on the wall."

# 10. Example solution: Ninety-nine Bottles of Beer on the Wall.
# bottles of beer program rewritten referring to the above english-numbers program (sample solution)
num_at_start = 10 # change to 9999 if you want
num_bot = proc { |n| "#{english_number(n)} bottle#{n == 1 ? '' : 's'}" }
num_at_start.downto(2) do |num|
puts "#{num_bot[num]} of beer on the wall, #{num_bot[num]} of beer!".capitalize
puts "Take one down, pass it around, #{num_bot[num-1]} of beer on the wall!"
end
puts "#{num_bot[1]} of beer on the wall, #{num_bot[1]} of beer!".capitalize
puts "Take one down, pass it around, no more bottles of beer on the wall!"


# 11. Exercise: Safer picture downloading
Dir.chdir '/home/ubuntu/workspace/launch_school/pine_book/move_pics_here'       # Where we want to move the pics to
pic_names = Dir['/home/ubuntu/workspace/launch_school/pine_book/pics/**/*.txt'] # Where the pics are located
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files: "
pic_number = 1
already_there = []
pic_names.each do |name|
  print '.' # This is our "progress bar".
  
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.txt"
  else
    "#{batch_name}#{pic_number}.txt"
  end

  if !File.exist?(new_name)
    File.rename(name, new_name)
  else
    already_there << name
  end
  # Finally, we increment the counter.
  pic_number += 1
end
puts 'Done, cutie!'
if already_there.length != 0
  puts  "#{already_there.length} files could not be moved!" +
      "The following files already exist in the destined location:"
  puts  already_there
end





# 11. Build your own playlist / Build a better playlist
# Those exercises are located in a separate file "playlist.rb"
# The sample solution for "Build a better playlist" is located in "playlist_pine.rb"





# 12. Exercise: One billion seconds
born = Time.gm(1988,9,7,12,00)
puts Time.new - born # how many seconds old
puts born + 1000000000 # when I reach 1 billion seconds in age


# 12. Exercise: Happy Birthday
puts "Which year born?"
y = gets.chomp.to_i
puts "Which month born?"
m = gets.chomp.to_i
puts "Which day born?"
d = gets.chomp.to_i
now = Time.new
age = 1
while Time.gm(y+age, m, d) < now
  puts "#{Time.gm(y+age, m, d).year}: Spank!"
  age += 1
end
puts "Today you are #{age-1} years old"


# 12. Exercise: Party like it’s roman_to_integer 'mcmxcix'!
def roman_to_integer(str)
  sequences = [ ["m", "mm", "mmm", "mmmm"],
                ["c", "cc", "ccc", "cd", "d", "dc", "dcc", "dccc", "cm"],
                ["x", "xx", "xxx", "xl", "l", "lx", "lxx", "lxxx", "xc"],
                ["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix"] ]
  number = 0
  sequences.each_with_index do |array, n| # Check for thousands, then hundreds, then tens, then ones. If str != empty then, not valid!
    n == 0 ? x = 4 : x = 0
    if str.start_with?(array[0], array[4 - x]) # All hundreds start with "c" or "d" etc, only special case for thousands bc there array[4]=nil
      array.reverse.each_with_index do |sequence, i| 
        if str.start_with?(sequence) # Reversing neccesary, bc a string starting with "ccc" would qualify for "c" otherwise -> IF runs too soon
          number += 10**(3-n)*(array.length-i) # array.length-i bc of reversing | n=0 => 10**(3-n) = 1000 etc
          sequence.length.times do # Here we delete the evaluated sequence from the beginning of the string
            arr = str.split("")
            arr.shift
            str = arr.join
          end
          break
        end
      end
    end
  end
  if str != ""
    puts "Please provide a valid roman number."
  else
    puts number
  end
end
roman_to_integer("gets.chomp.downcase")


# 12. Exercise: Birthday helper
def birthday(name) # I made it too complicated, the Time class accepts things like " 5" as valid input for days
  birthdays = File.readlines("birthdays.txt")
  hash = {}
  birthdays.each do |str|
    y = str[32..35]
    d = str[28..29].to_i.to_s
    m = str[24..26]
    n = str.split(",")[0]
    hash[n] = "#{m} #{d}, #{y}"
  end
  if hash.has_key?(name)
    if Time.gm(Time.new.year, (hash[name][0..2]), hash[name][4..5].to_i) < Time.new
      puts "#{name}'s next birthday is #{hash[name][0..-5]}#{Time.new.year+1}. " +
           "He is #{Time.new.year - hash[name][-4..-1].to_i} years old."
    else
      puts "#{name}'s next birthday is #{hash[name][0..-5]}#{Time.new.year}. " +
           "He is #{Time.new.year - hash[name][-4..-1].to_i + 1} years old."
    end
  else
    puts "No such name in the database"
  end
end
birthday("Christopher Pine")
birthday("The King of Spain")
birthday("Suru Bin Wi")
birthday("Hans")


# 13. Exercise: Extend the built-in classes
class Integer
  def to_eng
    if self == 5
      english = 'five'
    else
      english = 'forty-two'
    end
    english
  end
  def factorial
    fac = 1
    self.downto(2) do |x|
      fac *= x
    end
    fac
  end
end
puts 5.to_eng
puts 42.to_eng
puts 5.factorial
# Editing an existing class
class Array
  def shuffle
    self.sort_by! { |x| x = rand }
  end
end
puts [1,2,3,4,5,6,7,8,9].shuffle


# 13. In-text-exercise: Die ("Würfel") 
class Die
  def initialize
    roll
  end
  def roll
    @number_showing = 1 + rand(6)
  end
  def showing
    @number_showing
  end
  def cheat
    puts "What should the dice show? (1-6)"
    loop do
      @number_showing = gets.chomp.to_i
      if !@number_showing.between?(1, 6)
        puts "Please only numbers from 1 to 6"
        next
      end
    break
    end
  end
end
die = Die.new
puts die.showing
die.cheat
puts die.showing


# 13. Exercise: OrangeTree
class OrangeTree
  def initialize
    @height = 0
    @age = 0
    @fruit = 0
  end
  def height
    puts "The tree is #{@height}cm big"
  end
  def count_the_oranges
    puts "There #{@fruit==1? "is" : "are"} #{@fruit} orange#{@fruit==1? "" : "s"} on the tree."
  end
  def pick_an_orange
    if @fruit > 0
      @fruit -= 1
      puts "Mmmmhh, delicious!"
    else
      puts "No more oranges this year!"
    end
  end
  def one_year_passes
    @age += 1
    @height += 20
    @fruit = @age unless @age < 3
    puts "One year has passed..."
    death?
  end
  def status
    puts @height
    puts @age
    puts @fruit
  end
  private
  def death?
    if @age > 10
      puts "The tree is dead" 
      exit
    end
  end
end
my_tree = OrangeTree.new
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.status
my_tree.count_the_oranges
my_tree.height
my_tree.pick_an_orange
my_tree.pick_an_orange
my_tree.count_the_oranges
my_tree.pick_an_orange
my_tree.pick_an_orange
my_tree.status
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.one_year_passes
my_tree.status
my_tree.one_year_passes # Program exits after this because of the keyword "exit", next lines never reached!
my_tree.one_year_passes
my_tree.status


# 13. Exercise: Baby Dragon
class Dragon
  def initialize(name)
    @name = name
  end
  def feed
    puts "You feed your dragon."
  end
  def walk
    puts "You take a walk with you dragon while playing Pokemon Go."
  end
  def abandon
    puts "You abandon the dragon and go do homework instead."
    exit
  end
end
my_dragon = Dragon.new("Hans")
while true
  puts "What do you want your Dragon to do?"
  command = gets.chomp
  if my_dragon.respond_to?(command)
    my_dragon.send(command)
  else
    "This is not a legit command"
  end
end


# 14. Example: Counting execution time of a program
def profile(block_description, &block)
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds"
end
profile('count to a million') do
  number = 0
  1000000.times do
    number += 1
  end
end


# 14. Exercise: Even better profiling
$OPT_PROFILING_ON = false
def profile(block_description, &block)
  if $OPT_PROFILING_ON
    start_time = Time.new
    block.call
    duration = Time.new - start_time
    puts "#{block_description}: #{duration} seconds"
  else
    block.call
  end
end
profile('Execution time') do
  puts "hii"
  # Run a Ruby sub-program (remember: a block are just lines of code ready to be executed!)
end


# 14. Exercise: Grandfather clock
def clock(&block)
  h = Time.new.hour + 1
  h -= 12 if h >= 12
  h.times { block.call }
end
clock { puts 'DONG!' }


# 14. Exercise: Program logger
def log(block_description, &block)
  puts "Beginning #{block_description}..."
  value = block.call
  puts "...#{block_description} finished, returning: #{value}"
end
log("outer block") do
  log("some little block") do
    value = 5
  end
  log("some little block") do
    value = "I like Thai food!"
  end
  value = false
end


# 14. Exercise: Better program logger WITHOUT global variable
def log(block_description, depth=0, &block)
  indent = "  " * depth
  puts "#{indent}Beginning #{block_description}..."
  value = block.call
  #indent = "  " * $nesting_depth
  puts "#{indent}...#{block_description} finished, returning: #{value}"
  $nesting_depth = 0
end
log("outer block") do
  log("some little block", 1) do
    log("teeny-tiny block", 2) do
      value = "lots of love"
    end
    #$nesting_depth = 1
    value = 42
  end
  log("yet another block", 1) do
    value = "I like Indian food!"
  end
  value = true
end


# 14. Exercise: Better program logger WITH global variable
$nesting_depth = 0
def log(block_description, &block)
  indent = "  " * $nesting_depth
  puts "#{indent}Beginning #{block_description}..."
  $nesting_depth += 1
  value = block.call
  $nesting_depth -= 1
  puts "#{indent}...#{block_description} finished, returning: #{value}"
end
log("outer block") do
  log("some little block") do
    log("teeny-tiny block") do
      value = "lots of love"
    end
    value = 42
  end
  log("yet another block") do
    value = "I like Indian food!"
  end
  value = true
end
=end