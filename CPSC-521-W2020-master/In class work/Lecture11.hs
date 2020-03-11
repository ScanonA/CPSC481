

{- CONTINUED FROM PICTURES


Ackerman function
-----------------

  un.g(n,x) = h(x,o)
    where
	 h(n,x) = if g (n,x) == x then n 
	          else h(n+1,x)

**we fixed point y to implement this

So we know that in lambda-calculus one can express all computable functions 


Undecidability in the lambda-calculus 
--------------------------------------

The main result is the Scott Curry theorem. (analogue of Rice's Theorem)

A property P of the terms of the lambda-calculus is non-trivial in case there are terms A and B such that P(A) = not P(B)

P is closed to Beta-equality if whenever N =beta M then P(N) = P(M).

Theorem
-------- Given any predicate P, on the terms of the lambda-calculus for which there exist an A, B with P(A) = not P(B) (non trivial) then
                                              there are terms A' =beta B'  such that P(A') = P(B') (i.e. P is not closed to beta-equality)
											  

What is a predicate, P, on the terms of the lambda-calculus.
  P: lambda-terms --> Bool 
  but this can be "internally" represented in the lambda-calculus.
  i.e P is a lambda-calculus term (this makes the predicate computable)
  
  *we may internally represent the lambda-calculus terms in the lambda-calculus ... so if N is a lambda-calculus term
  we may thing of N as being an internal representation of the term.
  
  The predicate P then acts on these internal terms, P(N)
  
  The lambda-calculus terms can be internally represented using datatypes. 
  
  Now P is predicate of internal lambda-calculus means P N terminates with either True or False.

Ackerman's Function
--------------------

Example
-------

Consider the predicate 

P(N) is true iff N =beta lambda x.x

 * this is a non-trivial predicate lambda x.x is normal form
  so lambda x.x =/beta lambda xy.x 
 
 * I is clearly closde to beta equality.
 
 ** there exist A' =beta B' with P(A') = not P(B')    => There cannot be an internal predicate for deciding this




  
  -}