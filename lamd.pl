/* give a list of ints as input and check if their values first rise and then fall 
example execution "lambda([1,4,3,2,1])-->True, lambda([1,4,3,2,4])-->False"*/

lambda([X,Y,Z]):- !,X<Y , Y>Z.
lambda([X,Y|L]):- X<Y ,up([Y|L]),!.
up([X,Y|L]):- X<Y , up([Y|L]).
up([X,Y|L]):- X>Y ,down([X,Y|L]).
down([]).
down([_]).
down([X,Y|L]):- X>Y, down([Y|L]).
