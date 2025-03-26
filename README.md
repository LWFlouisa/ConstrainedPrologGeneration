# Constrained Prolog Generation
Generation of prolog variables using hyper-graphs and constraints.

## Graph For Variable Creation
~~~
#        cat dog gerbil
# cat    c,c c,d c,g
# dog    d,c d,d d,g
# gerbil g,c g,d g,g

#        brown black white
# brown  br,br br,bl br,wh
# black  bl,br bl,bl bl,wh
# white  wh,br wh,bl wh,wh

#          meows barls squeeks
# meows    m,m   m,b   m,s
# barks    b,m   b,b   b,s
# squeeks  s,m   s,b   s,s
~~~

And this creates:
~~~
cat(black, meows).
~~~

# History Of X and Y
~~~ruby
# Similar approaches to variable additions.
# Except instead of move_x or move_y: it adds move x or y history to history of move_x or move_y
def move_left_x
  $x = $x - 1
end

def move_right_x
  $x = $x + 1
end

def move_down_y
  $y = $y + 1
end

def move_up_y
  $y = $y - 1
end

# Records and recalls previous moves in x coordinates.
$previous_x = "You had moved #{$x} in the x coordinate."
$previous_y = "You had moved #{$y} in the y coordinate."

def move_x_record
  move_x = $previous_x

  File.open("_history/move_x/move_history.txt", "a") { |f|
    f.puts move_x
  }
end

def move_x_recall
  previous_moves = File.readlines("_history/move_x/move_history.txt")
  search_limit   = previous_move.size.to_i

  index = 0

  search_limit.times do
    puts "PREVIOUS MOVE X"
    puts previous_move[index]

    index = index + 1    
  end
end

# Records and recalls previous moves in y coordinates.
def move_y_record
  move_y = $previous_y

  File.open("_history/move_y/move_history.txt", "a") { |f|
    f.puts move_y
  }
end

def move_y_recall
  previous_moves = File.readlines("_history/move_y/move_history.txt")
  search_limit   = previous_move.size.to_i

  index = 0

  search_limit.times do
    puts "PREVIOUS MOVE Y"
    puts previous_move[index]

    index = index + 1    
  end
end
~~~
