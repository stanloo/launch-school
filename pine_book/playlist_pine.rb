# Chris' comments
## My additional comments
require "pry"

def music_shuffle(filenames)
  songs_and_paths = filenames.map do |s|
    [s, s.split('/')] # [song, path]
  end
  ## After this: songs_and_paths = [["aa/a1", ["aa", "a1"]], ["aa/a2", ["aa", "a2"]], ... ["bb", "b11"]], ["bb/b12", ["bb", "b12"]]]
  
  tree = {:root => []}
  # put each song into the tree
  insert_into_tree = proc do |branch, song, path| ## 1st input:     branch = {:root => []}     song = "aa/a1"     path = ["aa", "a1"]
    if path.length == 0 # add to current branch
      branch[:root] << song
    else # delve deeper
      sub_branch = path[0]
      path.shift # like "pop", but pops off the front
      if !branch[sub_branch]
        branch[sub_branch] = {:root => []}
      end
      insert_into_tree[branch[sub_branch], song, path]
    end
  end
  songs_and_paths.each{|sp| insert_into_tree[tree, *sp]} ## 1st sp = ["aa/a1", ["aa", "a1"]]     * is the splat operator
  ## After Proc: tree = {:root=>[], "aa"=>{:root=>[], "a1"=>{:root=>["aa/a1"]}, "a2"=>{:root=>["aa/a2"]}, ... "b12"=>{:root=>["bb/b12"]}}}
  
  ## Here is the output for "weighted_song" right before the last "".sort.map"
  ## Explanation below...
=begin
  => [["aa/a5", 0.0050884776075346295],
 ["aa/a3", 0.22556746955301987],
 ["aa/a4", 0.3682493415294886],
 ["aa/a6", 0.5285315337741593],
 ["aa/a2", 0.6989084997830578],
 ["aa/a1", 0.822587234138358],
 ["aa/a7", 0.9454748167966215],
 ["AAA/yyyy", 0.2999012262492858],
 ["AAA/xxxx", 0.5013053490838063],
 ["AAA/zzzz", 0.7158661340390676],
 ["foo/bar/h1", 0.06327845510168548],
 ["foo/bar/h3", 0.2283290205775878],
 ["foo/bar/h2", 0.4142827701893793],
 ["foo/bar/h5", 0.7133100562030723],
 ["foo/bar/h4", 0.930102773722092],
 ["bb/b8", 0.02522990867340898],
 ["bb/b5", 0.10165316863732295],
 ["bb/b7", 0.23195312992531592],
 ["bb/b6", 0.274017293815026],
 ["bb/b10", 0.3937837276832859],
 ["bb/b1", 0.48435673073539826],
 ["bb/b12", 0.5653485434262914],
 ["bb/b11", 0.6228211450840115],
 ["bb/b2", 0.6827044205783929],
 ["bb/b4", 0.7629094779034156],
 ["bb/b9", 0.896034744261644],
 ["bb/b3", 0.9543859467237369]]
=end

  ## Here is what roughly happens next:
  ## 1. Chris makes a random shuffle for tracks in an album (so that e.g. a1-a7 are in random order), but he does it with his method
  ## 2. He spreads them within the 0..1 range as far as possible from each other (with a random factor mixed in)
  ## 3. When he combines all tracks into a single array, he can now sort them according to their weigth
  ## 4. I really like this method, it feels really random :)
  
  # recursively: ## The following happens in the next Proc
  # - shuffle sub-branches (and root)
  # - weight each sub-branch (and root)
  # - merge (shuffle) these groups together
  
  shuffle_branch = proc do |branch| ## 1st input: branch = tree = {:root=>[], "aa"=>{:root=>[], "a1"=>{:root=>["aa/a1"]}, ...
    shuffled_subs = []
    branch.each do |key, unshuffled|
      shuffled_subs << if key == :root
        unshuffled # At this level, these are all duplicates.
      else
        shuffle_branch[unshuffled]
      end
    end
    weighted_songs = []
    shuffled_subs.each do |shuffled_songs|
      shuffled_songs.each_with_index do |song, idx|
        num = shuffled_songs.length.to_f
        weight = (idx + rand) / num
        weighted_songs << [song, weight]
      end
    end
  weighted_songs.sort_by{|s,v| v}.map{|s,v| s}
  end
  
  shuffle_branch[tree]
end
songs = ['aa/a1', 'aa/a2', 'aa/a3', 'aa/a4', 'aa/a5', 'aa/a6', 'aa/a7',
'AAA/xxxx', 'AAA/yyyy', 'AAA/zzzz', 'foo/bar/h1', 'foo/bar/h2', 'foo/bar/h3', 'foo/bar/h4', 'foo/bar/h5', 
'bb/b1', 'bb/b2', 'bb/b3', 'bb/b4', 'bb/b5', 'bb/b6', 'bb/b7', 'bb/b8', 'bb/b9', 'bb/b10', 'bb/b11', 'bb/b12', ]
puts(music_shuffle(songs))