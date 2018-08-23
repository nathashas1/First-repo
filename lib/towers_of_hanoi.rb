# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
def initialize
  @towers=[[3,2,1],[],[]]
end

def play
  puts render
  until won?
    from_tower,to_tower=get_move
    if valid_move?(from_tower,to_tower)
      move(from_tower, to_tower)
      p @towers
      puts render
  end
end
puts "you won"
end

def render
  system("clear")
  top_row=@towers.map {|tower| tower.length>=3? tower[2] : " "}.join(" ")
  mid_row=@towers.map {|tower| tower.length>=2? tower[1] : " "}.join(" ")
  bot_row=@towers.map {|tower| tower.length>=1? tower[0] : " "}.join(" ")
  "#{top_row}\n#{mid_row}\n#{bot_row}\n_ _ _"
end

def get_move
  print "Enter your move Eg: 0,0"
  puts "\n"
input=gets.chomp
input.split(",").map {|char| char.to_i}
end

#fjhgbefjg
#ghrtdyhrtyr6urtir6


def towers
  @towers
end

def move(from_tower, to_tower)
   @towers[to_tower] << @towers[from_tower].pop
end

def valid_move?(from_tower, to_tower)
  return false if @towers[from_tower].empty?
  return true if @towers[to_tower].empty?
    return false  if @towers[from_tower].last > @towers[to_tower].last
    true
end

  def won?
    return true if (@towers.any? {|tower| tower.length==3}) && (@towers[0].empty?)
    false
  end
end


if __FILE__==$PROGRAM_NAME
t=TowersOfHanoi.new
t.play
end
