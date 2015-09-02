/* this program takes 2 unsigned ints (n,k) as input and returns a list with the permutation P1,P2,..Pn of
the numbers in range 1...n  so that the group of numbers |P1-P2|,|P2-P3|,...|P(n-1)-Pn| has k unique elements.
The complexity of the solution is polynomial.
example execution "permutation(5,2,L)-->L=[1,3,2,4,5]"*/

permutation(0,0,[]).
permutation(N,K,Final):- K>0,M is N-K, permutation(M,0,L),addlast(L,K,R),append(R,L,Final). 
permutation(N,0,Final):- M is N-1, permutation(M,0,L),append([N],L,Final).
addlast(_,0,_).
addlast([X|L],K,R):- K>0, S is K-1, N is X+K,minuslast([N,X|L],S,Q),append(Q,[N],R).
minuslast(_,0,_).
minuslast([X|L],K,R):- K>0, S is K-1, N is X-K,addlast([N,X|L],S,Q),append(Q,[N],R).
 
