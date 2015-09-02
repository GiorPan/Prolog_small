/*same as min_bin_w_1.hs in ../Haskell_small written in prolog
example execution bits([1],[1,0,1,0],X)-->X=[1,1,1]*/

bits(L,M,X):-bits2(L,M,S),check(S,X),!.
check([0],[0]). /*gia na mhn epistreyei kenh lista sthn periptwsh bits([0],[0],X)*/
check([0|S],S).
check([1|S],[1|S]).
bits2([0],[0],[0]).
bits2([0],[Z|M],X):- Z is 1, firstcase([Z|M],X).
bits2([0],[Z|M],X):- Z is 0, bits2([0],M,X).
bits2([Z|L],[Y|R],X):- Z is 1, Y is 1, length([Z|L],Len1), length([Y|R],Len2), Len1<Len2, firstcase([Y|R],X).
bits2([Z|L],[Y|R],X):- Z is 1, Y is 1, length([Z|L],Len1), length([Y|R],Len2), Len1==Len2,bits2(L,R,J), append([1],J,X).
bits2([Z|L],[Y|R],X):- Z is 1, Y is 0,bits2([Z|L],R,X).
bits2([Z|L],[Y|R],X):- Z is 0, Y is 1,bits2(L,[Y|R],X).
bits2([Z|L],[Y|R],X):- Z is 0, Y is 0,bits2(L,R,J),append([0],J,X).
firstcase([],_).
firstcase([Z|M],X):-Z is 1, firstcase(M,J),append(J,[1],X).
firstcase([Z|M],X):-Z is 0, addrest(M,X,J),append([0],J,X).
addrest([],_,_).
addrest([_|L],X,Final):-addrest(L,X,J),append(J,[1],Final).
