

{- CONTINUED FROM PICTURES

Theorem (Scott Curry)
-------

Given any recursion predicate P on the terms of the lambda-calculus which is non-trivial (there exist A, B with P(A) = not P(B) )
then there arre terms A' and B' such that A' = beta B' and yet P(A') = not P(B')

We represent lambda-terms internally in the lambda-calculus by using the datatype 
	Lambda a = Var a 
	  | App (Lamda a) (Lambda a)
	  | Abst a (Lambda a)

We can use (Lambda Nat), so the variables are represented in the church numerals. 

We shall write a lambda calculus term N translated to an internal term inside the lambda-calculus as N::Lambda Nat 
For these syntactic terms we have an application 
N * M := App N M 

Furthermore we can define a translation, a lamba-calculus term T such that 
   T N = N
     -   =

Note:
N M = N * M
---   -   -

One can do this translation using folds: we have to translate to church numerals and we have to translate Lamda Nat terms.

    n = foldN zero (lambda x . succ . x) n  <---(n is a church numeral)
	=

    zero = Abst 1 (Abst 2 1)
	----        -       - =
	
	T t = foldlambda (lambda x , Var.x)
                     (lambdaxy.(App.x).y)
					 (lambdanx.(Abst.n).x)
					 (Maplambda (foldN zero (lambdax.succ.x))t)

                                                                                                                                        !
A predicate to be "recursive" or "compatible" means there is a lambda-calculus term P which give a lambda term N always terminates (P N v)
and has output either True or False.

Lemma (Second recursion theorem)
-----
  Given any F, a lambda term, there is a lambda term x, such that X =beta F X.
  

Proof. Define H:= lambda x.F(x.Tx) where T is the translation.
    then  H H =p F (H * T H) =beta F(H *H) = F (H H)
	        -       -     -          -  =       --=
	so set X = H H
	

Proof of (Scott-Curry)
  Set F := lambda x . if (Px) then B else A
  
  Assume P A= True and P B is false.
  
  Now chose X with X =beta F X
                             -
  If P X is true:
     we have X=beta F X =beta B so set A'=X and B'=B
	 then we have
	    P(A') = P(X) = True 
		  -       -
		P(B') = P(B) = False 
		  -       -
		  
		but A' = X =beta F X =beta B = B'
		                   -
	IF p x IS FALSE : then we have X=beta F X =beta Abst
	                                        -
	so set A' = A and B' = X
	P(A') = True  P(B') = P(X) = False but A =beta X


Corollary
---------
	When P is a property which is non-trivial and closed to beta-equality then there is no recursive predicate P (a lambda-calculus term)
	which implements P.

               ~
Proof. Suppose P  does implement P as a lambda-calculus term which normalizes to True or False on every N. Then, by assumption, there exist A
           ~              ~
and B with P A = True and P B = False.
             -              -
                                      ~           ~
but then we have A' =beta B' such that P A' = not P B' showing P is not closed to B-equality  (-X-)
                                         -          -

1) The property P(X) <=> N =beta X for some fixed N 
  cannot be implemented (is undecidable)
  
  *The property is non-trivial because 
  P (N) = True 
  but one of P(True) and P(False) is false!
  * P is closed to B-equality obviously
  
  *this means = P cannot be implemented i.e undecidable 
  
2) P(X) <==> X has a normal form 
 P is undecidable 
 * P is non-trivial as 
 P (True) = False   P (omega) = False 
 where omega = (lambda x.x x)(lambdax.x x)
 * P is closed to beta-equality 
   a consequence of Church_Rosser

3) If a property P is non-trivial and closed to Beta-equality then not P is as well

4) A lambda-term, N, solvable if there are lambda-terms M, .., Mn such that 
  N M, .. Mn = lambda x . x = I being solvable is undecidable.
  
  
*solvability is non-trivial 
-I is solvable
- (lambda x.x x) (lambda x.x x) is insoluable 
- solvability is closed to beta-reduction 
if N =beta M and N M1,.. Mn


**Examen questions : Church rossel theorem, beta reductions, Implementing data in lambda calculus, implementing recursion in lambda calculus.
	



  
  -}