# naval_beast(X) :- beast(X).

# beast(cochonbuta).

# naval_report :-
#   write('All known naval creatures: '), nl,
#   beast(X),
#   write(X), nl,
#   fail.

#            beast(A). beast(B). beasy(C).
# beast(A).  A,A       A,B       A,C
# beast(B).  B,A       B,B       B,C
# beasy(C).  C,A       C,B       C,C

beasts = [
  [["beast(A).", "beast(A)."], ["beast(A).", "beast(B)."], ["beast(A).", "beast(C)."]],
  [["beast(B).", "beast(A)."], ["beast(B).", "beast(B)."], ["beast(B).", "beast(C)."]],
  [["beast(C).", "beast(A)."], ["beast(C).", "beast(C)."], ["beast(C).", "beast(C)."]],
]

row_options = [0, 1, 2]
col_options = [0, 1, 2]
arr_options = [0, 1]

cur_row = row_options.sample
cur_col = col_options.sample
cur_arr = arr_options,sample

assigned_beast = beasts[cur_row][cur_col][cur_arr]

#                naval_beasts desert_beasts taiga_beasts
# naval_beasts
# desert_beasts
# taiga_beasts

# Bases beast subsets on beast variables.
if    assigned_beast == "beast(A)."; new_context = 0; var_name = "A"
elsif assigned_beast == "beast(B)."; new_context = 1; var_name = "B"
elsif assigned_beast == "beast(C)."; new_context = 2; var_name = "C"
else
  abort
end

beast_subsets = [
  [["naval_beasts(A) :-",  "naval_beasts(A) :- "], ["naval_beasts(A) :- ",  "desert_beasts(A) :- "], ["naval_beasts(A) :- ",  "taiga_beasts(A) :- "]],
  [["desert_beasts(A) :-", "naval_beasts(A) :- "], ["desert_beasts(A) :- ", "desert_beasts(A) :- "], ["desert_beasts(A) :- ", "taiga_beasts(A) :- "]],
  [["taiga_beasts(A) :-",  "taiga_beasts(A) :- "], ["taiga_beasts(A) :- ",  "desert_beasts(A) :- "], ["taiga_beasts(A) :- ",  "taiga_beasts(A) :- "]],
], [
  [["naval_beasts(B) :-",  "naval_beasts(B) :- "], ["naval_beasts(B) :- ",  "desert_beasts(B) :- "], ["naval_beasts(B) :- ",  "taiga_beasts(B) :- "]],
  [["desert_beasts(B) :-", "naval_beasts(B) :- "], ["desert_beasts(B) :- ", "desert_beasts(B) :- "], ["desert_beasts(B) :- ", "taiga_beasts(B) :- "]],
  [["taiga_beasts(B) :-",  "taiga_beasts(B) :- "], ["taiga_beasts(B) :- ",  "desert_beasts(B) :- "], ["taiga_beasts(B) :- ",  "taiga_beasts(B) :- "]],
], [
  [["naval_beasts(C) :-",  "naval_beasts(C) :- "], ["naval_beasts(C) :- ",  "desert_beasts(C) :- "], ["naval_beasts(C) :- ",  "taiga_beasts(C) :- "]],
  [["desert_beasts(C) :-", "naval_beasts(C) :- "], ["desert_beasts(C) :- ", "desert_beasts(C) :- "], ["desert_beasts(C) :- ", "taiga_beasts(C) :- "]],
  [["taiga_beasts(C) :-",  "taiga_beasts(C) :- "], ["taiga_beasts(C) :- ",  "desert_beasts(C) :- "], ["taiga_beasts(C) :- ",  "taiga_beasts(C) :- "]],
]

#                naval_report desert_report taiga_report
# naval_report   n,n          n,d           n,t
# desert_report  d,n          d,d           d,t
# taiga_report   t,n          t,d           t,t

naval_report = "naval_report :-
  write('All known naval creatures: '), nl,
  #{assigned_beast},
  write(#{var_name}), nl,
  fail.
"

desert_report = "desert_report :-
  write('All known desert creatures: '), nl,
  #{assigned_beast},
  write(#{var_name}), nl,
  fail.
"

taiga_report = "taiga_report :-
  write('All known taiga creatures: '), nl,
  #{assigned_beast},
  write(#{var_name}), nl,
  fail.
"

beast_reports = [
  [[naval_report,  naval_report], [naval_report,  desert_report], [naval_report,  taiga_report]],
  [[desert_report, naval_report], [desert_report, desert_report], [desert_report, taiga_report]],
  [[taiga_report,  naval_report], [taiga_report,  desert_report], [taiga_report, taiga_report]],
]

new_beast_subset = beast_subsets[new_context][cur_row][cur_col][cur_arr]
new_beast_report = beast_reports[cur_row][cur_col][cur_arr]

new_function = "
#{new_beast_subset} :- #{assigned_beast}

#{new_beast_report}"
