$x = 0
$y = 0

$player_hp           = 10
$player_half_atk     =  1
$player_standard_atk =  2
$player_critical_atk =  4

$enemy_hp           = 10
$enemy_half_atk     =  1
$enemy_standard_atk =  2
$enemy_critical_atk =  4

#   x
#   left x
#   .
# .   . right x
#   .
#

#      y
#          Up Y
#          .
# Down Y .   .
#          .
#

###############
#        @      
#      . . .    
#    . . . . .  
#  . . . . . . .
#    . . . . .
#      . . .
#        .

## Damage formulas

def standard_player_behaviours
  #          None Half Standard Double
  # None     N,N  N,H  N,S      N,D
  # Half     H,N  H,H  H,S      H,D
  # Standard S,N  S,H  S,S      S,D
  # Double   D,N  D,H  D,S      D,D

  damage_chances = [
    [["none",     "none"], ["none",     "half"], ["none",    "standard"], ["none",     "double"]],
    [["half",     "none"], ["half",     "half"], ["half",    "standard"], ["half",     "double"]],
    [["standard", "none"], ["standard", "half"], ["standed", "standard"], ["standard", "double"]],
    [["double",   "none"], ["double",   "half"], ["double",  "standard"], ["double",   "double"]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  hit_chances = damage_chances[cur_row][cur_col][cur_arr]

  if    hit_chances ==     "none"; puts ">> The enemy recieved no damage..."
  elsif hit_chances ==     "half"; @enemy_hp = @enemy_hp -     @player_half_atk; puts ">> The hp of the enemy is down to #{@enemy_hp}."
  elsif hit_chances == "standard"; @enemy_hp = @enemy_hp - @player_standard_atk; puts ">> The hp of the enemy is down to #{@enemy_hp}."
  elsif hit_chances ==   "double"; @enemy_hp = @enemy_hp - @player_critical_atk; puts ">> The hp of the enemy is down to #{@enemy_hp}."
  end
end

def standard_enemy_behaviours
  #          None Half Standard Double
  # None     N,N  N,H  N,S      N,D
  # Half     H,N  H,H  H,S      H,D
  # Standard S,N  S,H  S,S      S,D
  # Double   D,N  D,H  D,S      D,D

  damage_chances = [
    [["none",     "none"], ["none",     "half"], ["none",    "standard"], ["none",     "double"]],
    [["half",     "none"], ["half",     "half"], ["half",    "standard"], ["half",     "double"]],
    [["standard", "none"], ["standard", "half"], ["standed", "standard"], ["standard", "double"]],
    [["double",   "none"], ["double",   "half"], ["double",  "standard"], ["double",   "double"]],
  ]

  if    hit_chances ==     "none"; puts ">> The enemy recieved no damage..."
  elsif hit_chances ==     "half"; @player_hp = @player_hp -     @enemy_half_atk; puts ">> The hp of the enemy is down to #{@player_hp}."
  elsif hit_chances == "standard"; @player_hp = @player_hp - @enemy_standard_atk; puts ">> The hp of the enemy is down to #{@player_hp}."
  elsif hit_chances ==   "double"; @player_hp = @player_hp - @enemy_critical_atk; puts ">> The hp of the enemy is down to #{@player_hp}."
  end
end

# Move based on coords of x and y.
def  move_left_x; $x = $x - 1; end
def move_right_x; $x = $x + 1; end
def    move_up_y; $y = $y - 1; end
def  move_down_y; $y = $y + 1; end

# Row 0
def draw_x0_y0
  puts "      @      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x1_y0
  puts "      .      "
  puts "    .   @    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x2_y0
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   @  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x3_y0
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   @"
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

# Row 1
def draw_x0_y1
  puts "      .      "
  puts "    @   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x1_y1
  puts "      .      "
  puts "    .   .    "
  puts "  .   @   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x2_y1
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   @   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x3_y1
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   @  "
  puts "    .   .    "
  puts "      .      "
end

# Row 2
def draw_x0_y2
  puts "      .      "
  puts "    .   .    "
  puts "  @   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x1_y2
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   @   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x2_y2
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   @   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x3_y2
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   @    "
  puts "      .      "
end

# Row 3
def draw_x0_y3
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts "@   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x1_y3
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  @   .   .  "
  puts "    .   .    "
  puts "      .      "
end

def draw_x2_y3
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    @   .    "
  puts "      .      "
end

def draw_x3_y3
  puts "      .      "
  puts "    .   .    "
  puts "  .   .   .  "
  puts ".   .   .   ."
  puts "  .   .   .  "
  puts "    .   .    "
  puts "      @      "
end

#############################################################################
#                          Enemy Move Behaviours                            #
#############################################################################
def enemy_move_behaviours
  # Coming Soon
end

loop do
  ## Drawing the map.
  if    $x == 0 and $y == 0; draw_x0_y0
  elsif $x == 0 and $y == 1; draw_x0_y1
  elsif $x == 0 and $y == 2; draw_x0_y2
  elsif $x == 0 and $y == 3; draw_x0_y3
  elsif $x == 1 and $y == 0; draw_x1_y0
  elsif $x == 1 and $y == 1; draw_x1_y1
  elsif $x == 1 and $y == 2; draw_x1_y2
  elsif $x == 1 and $y == 3; draw_x1_y3
  elsif $x == 2 and $y == 0; draw_x2_y0
  elsif $x == 2 and $y == 1; draw_x2_y1
  elsif $x == 2 and $y == 2; draw_x2_y2
  elsif $x == 2 and $y == 3; draw_x2_y3
  elsif $x == 3 and $y == 0; draw_x3_y0
  elsif $x == 3 and $y == 1; draw_x3_y1
  elsif $x == 3 and $y == 2; draw_x3_y2
  elsif $x == 3 and $y == 3; draw_x3_y3
  else
    puts "Map not rendered..."
  end

  conditions = {
    "epee"  =>  "ishi",
    "ishi"  => "bache",
    "bache" =>  "ishi",
  }

  puts  "NAME: Souer Yume" + "HP: #{$player_hp}"

  print "epee, ishi, bache, move >> "; @choice = gets.chomp

  sleep(1.5)

  puts "#{$monster_name} EHP: #{$enemy_hp}"
  possible_enemy_choices = ["epee", "ishi", "bache"]

  @cchoice = possible_enemy_choices.sample

  if    conditions[@cchoice] == @choice
    standard_enemy_behaviors
  elsif conditions[@choice]  == @cchoice
    standard_player_behaviours
  elsif @cchoice == @choice
    puts ">> You reached a stalemate..."
  #elsif @cchoice == "Move"
    #enemy_move_behaviours
  elsif @choice  == "Move"
    print "Where to ( U, D, L, R ) << "; where = gets.chomp

    if    where == "U";    move_up_y; puts    ">> You went up."; sleep(1.6)
    elsif where == "D";  move_down_y; puts  ">> You went down."; sleep(1.5)
    elsif where == "L";  move_left_x; puts  ">> You went left."; sleep(1.5)
    elsif where == "D"; move_right_x; puts ">> You went right."; sleep(1.5)
    else
      puts ">> No such direction."
    end
  end
end
