#        cat dog gerbil
# cat    c,c c,d c,g
# dog    d,c d,d d,g
# gerbil g,c g,d g,g

#        brown black white
# brown  br,br br,bl br,wh
# black
# white

#          meows barls squeeks
# meows    m,m   m,b   m,s
# barks
# squeeks

nouns = [
  [["cat",    "cat"], ["cat",    "dog"], ["cat",    "gerbil"]],
  [["dog",    "cat"], ["dog",    "dog"], ["dog",    "gerbil"]],
  [["gerbil", "cat"], ["gerbil", "dog"], ["gerbil", "gerbil"]],
]

adjectives = [
  [["brown", "brown"], ["brown", "black"], ["brown", "white"]],
  [["black", "brown"], ["black", "black"], ["black", "white"]],
  [["white", "brown"], ["white", "black"], ["white", "white"]],
]

verbs = [
  [["meows",   "meows"], ["meows",   "barks"], ["meows",   "squeeks"]],
  [["barks",   "meows"], ["barks",   "barks"], ["barks",   "squeeks"]],
  [["squeeks", "meows"], ["squeeks", "barks"], ["squeeks", "squeeks"]],
]

row_options = [0, 1, 2]
col_options = [0, 1, 2]
arr_options = [0, 1]

cur_row = row_options.sample
cur_col = col_options.sample
cur_arr = arr_options.sample

new_noun      = nouns[cur_row][cur_col][cur_arr]
new_adjective = adjectives[cur_row][cur_col][cur_arr]
new_verb      = verbs[cur_row][cur_col][cur_arr]

new_variable = "#{new_noun}(#{new_adjective}, #{new_verb).}"

File.open("_knowledge/knowledge.pl", "a") { |f|
  # Cases for squeeks
  if    new_variable == "cat(brown, squeeks)."; puts "Nonsense, not appended."
  elsif new_variable == "dog(brown, squeeks)."; puts "Nonsense, not appended."
  elsif new_variable == "cat(black, squeeks)."; puts "Nonsense, not appended."
  elsif new_variable == "dog(black, squeeks)."; puts "Nonsense, not appended."
  elsif new_variable == "cat(white, squeeks)."; puts "Nonsense, not appended."
  elsif new_variable == "dog(white, squeeks)."; puts "Nonsense, not appended."

  # Cases for meows.
  elsif new_variable ==    "dog(black, meows)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(black, meows)."; puts "Nonsense, not appended."
  elsif new_variable ==    "dog(brown, meows)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(brown, meows)."; puts "Nonsense, not appended."
  elsif new_variable ==    "dog(white, meows)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(white, meows)."; puts "Nonsense, not appended."

  # cases for barks
  elsif new_variable ==    "cat(black, barks)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(black, barks)."; puts "Nonsense, not appended."
  elsif new_variable ==    "cat(brown, barks)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(brown ,barks)."; puts "Nonsense, not appended."
  elsif new_variable ==    "cat(white, barks)."; puts "Nonsense, not appended."
  elsif new_variable == "gerbil(white, barks)."; puts "Nonsense, not appended."
  else
    f.puts new_variable.
  end
}
