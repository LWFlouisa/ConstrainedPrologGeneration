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
