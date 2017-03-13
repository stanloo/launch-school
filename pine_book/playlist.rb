=begin
# 11. Exercise: Build your own playlist
def shuffle(arr)
  arr.sort_by! { |x| x = rand }
end

# Version 1 with YAML, not the right display of strings in the final playlist file though
require 'yaml'
Dir.chdir '/home/ubuntu/workspace/launch_school/pine_book'
# We move where we want our playlist file to be because File.open creates a file where we currently are
music_tracks = shuffle(Dir['/home/ubuntu/workspace/launch_school/pine_book/music/**/*.txt']) # Choose all files to include in our list
puts "Name of the playlist?"
playlist_name = gets.chomp
playlist = []
music_tracks.each do |track|
  print '.' # This is our "progress bar"
  playlist << track
end
File.open("#{playlist_name}.m3u", "w+") { |file| file.write playlist.to_yaml }
read_playlist = File.read("#{playlist_name}.m3u")
puts read_playlist
puts 'Playlist created!'

# Version 2 without YAML, much better!
Dir.chdir '/home/ubuntu/workspace/launch_school/pine_book'
# We move where we want our playlist file to be because File.open creates a file where we currently are
music_tracks = shuffle(Dir['/home/ubuntu/workspace/launch_school/pine_book/music/**/*.txt']) # Choose all files to include in our list
puts "Name of the playlist?"
playlist_name = gets.chomp
music_tracks.each do |track|
  print '.' # This is our "progress bar"
  File.open("#{playlist_name}.m3u", "a") { |file| file.write "#{track}\n" }
end
read_playlist = File.read("#{playlist_name}.m3u")
puts read_playlist
puts 'Playlist created!'
=end





=begin
# 11. Exercise: Build a better playlist -> mixing twice and cutting once
def music_shuffle(arr, num=2)
  num.times { arr = mix2(arr) }
  arr = divide(arr)
end

def divide(arr)
  num = rand(arr.length-1) + 1 # CAREFUL: for example rand(5) gives numbers from 0 to 4! /// Also, I don't want to cut at i=0
  new = arr[num..arr.length-1] + arr[0..num-1]
  new
end

# Does the following: [1,2,3,4,5,6] becomes [1,4,2,5,3,6]
# same result as mix1 but more elegant (and even without recursion, all thanks to a clever algorithm)
# Algorithm: If length is odd, take an element from the middle*, if length even take element from the far left
# *Essentially this functions as our "right" stack... it's like a cheat... clever algorithm
def mix2(arr)
  mixed = []
  arr.length.times do
    if arr.length.odd?  
      mixed << arr[arr.length / 2]
      arr.delete_at(arr.length / 2)
    else
      mixed << arr[0]
      arr.delete_at(0)
    end
  end
  mixed
end

# Creating a playlist from "Build your own playlist"-exercise
Dir.chdir '/home/ubuntu/workspace/launch_school/pine_book'
# We move where we want our playlist file to be because File.open creates a file where we currently are
music_tracks = music_shuffle(Dir['/home/ubuntu/workspace/launch_school/pine_book/music/**/*.txt']) # Choose all files to include in our list
puts "Name of the playlist?"
playlist_name = gets.chomp
music_tracks.each do |track|
  print '.' # This is our "progress bar"
  File.open("#{playlist_name}.m3u", "a") { |file| file.write "#{track}\n" }
end
read_playlist = File.read("#{playlist_name}.m3u")
puts read_playlist
puts 'Playlist created!'

def mix1(arr) # mix2 is the same solution but more elegant, mix1 here just for personal reference
  left = []
  right = []
  shuffled = []
  i = 0
  while i < arr.length / 2
    left << arr[i]
    i += 1
  end
  i = (arr.length) / 2
  while i < arr.length
    right << arr[i]
    i += 1
  end
  p left
  p right
  arr.length.times do
    if left.length >= right.length
      shuffled << left[0]
      left.shift
    else
      shuffled << right[0]
      right.shift
    end
  end
  arr = shuffled
end

def divide_example_solution(arr) # The example solution for the divide method (from the book), just for personal reference
new = []
cut = rand(arr.length) # Index of card to cut at (Chris allows to cut at i=0, leaving the array as it was. In my solution I don't.)
i = 0
  while i < arr.length
    new << arr[(i+cut)%arr.length] # Common algorithm for Chris (hard to grasp from looking) -> basically you only get the rest of division
    i += 1
  end
  new
end
=end





# 11. Exercise: Build a better playlist -> shuffle with a better algorithm

# "merge" is one solution for the ~perfect shuffle (similar to my "Durchmischungsproblem")
# It's not perfect, there are still local clumps here and there (because every iteration follows the same algorithm)
# For better results: Don't merge arr5 with arr 10 and THEN merge arr3 with the result. Instead: Merge the result of arr3/arr5 with arr10.
def merge(small, big)
  result = []
  if small.length > big.length then small, big = big, small end # Just in case... (if "small" is the longer array)
  if small.length == big.length # special case, both arrays same length
    big.each_with_index do |e, i|
      result << big[i]
      result << small[i]
    end
    return result
  end
  ls = small.length.to_f
  lb = big.length.to_f
  ratio = (lb - 1)/ls
  result = big.dup
  shifts = 0
  small.each_with_index do |element, i|
    x = (i+1) * ratio - 0.5*(lb/ls) + shifts # Returns the exact position the element should be inserted at
    (x - x.to_i) == 0 ? result.insert(x, element) : result.insert((x+1).to_i, element) # If x is a float, round it to an integer
    shifts += 1 # If we insert an element into the array, array gets longer. Next insert has to "shift" the insert position then.
  end
  result
end

# Used to randomly shuffle a given rudimentary list (e.g. an album) before merging lists together
def shuffle(arr)
  arr.sort_by! { |x| x = rand }
end

# Used for looping through a multi_array and merge all the sub_arrays until there is only one array left in the form of [[elements]]
def merging(multi_array)
  multi_array.sort_by! { |x| x.length } # Sorting: E.g. arrays of lengths 7, 8, 9, 10: in the next step (15,9,10) we want to merge 9 and 10!
  temp = merge(multi_array[0], multi_array[1])
  2.times { multi_array.shift }
  multi_array.unshift(temp)
  unless multi_array.length == 1
    merging(multi_array) # Recursive
  end
  multi_array
end

# Main function where the array of shuffled tracks (actually paths) is created
def create_playlist(path)
  Dir.chdir path # Always change path to the inner scope as long a neccesary (so that the program recognizes folders with File.directory?(x) )
  dir = Dir.new(path)
  arr = []
  tracks = []
  Dir.foreach(dir) do |x|
    next if x == "." || x == ".."
    if File.directory?(x)
      temp = create_playlist(path + "/#{x}")
      arr << temp unless temp == [] # Don't track empty folder OUTSIDE OF FOLDER (so that merging executes faster)
      Dir.chdir path # Change path back (to the outer scope)
    else
      # tracks << x # Dummy solution for easier readability while building program (just for reference)
      tracks << path + "/#{x}"
    end
  end
  shuffle(tracks) # Shuffle every rudimentary track-list before merging it with another
  arr << tracks unless tracks == [] # Don't create an array WITHIN AN EMPTY FOLDER (so that the merging executes faster)
  arr.length < 2 ? arr.flatten : merging(arr).flatten # return
end

# My approach: Go to every folder and subfolder and merge the respective branches together
puts "Name of the playlist?"
playlist_name = gets.chomp
path = '/home/ubuntu/workspace/launch_school/pine_book/music.1'
music_tracks = create_playlist(path)
Dir.chdir '/home/ubuntu/workspace/launch_school/pine_book' # Moving here because File.open creates a file where we currently are
music_tracks.each do |track|
  print '.' # This is our "progress bar"
  File.open("#{playlist_name}.m3u", "a") { |file| file.write "#{track}\n" }
end
read_playlist = File.read("#{playlist_name}.m3u")
puts read_playlist
puts 'Playlist created!'
