

{-

Reduction order matters!!!
---------------------------

If true then False else omega
 ..
 =

(lambda x y.x) (lamda x y.y) ((lamda x.x x)(lamda x.x x))

    ! beta
	V
(lambda y.(ambda x y.y))((lambda x.x x)(lambda x.x x))
    ! beta
	V
  (lambda x y.y)

Leftmost-outermost reduction ≡ normal order reduction 


Theorem If N is beta-equivalent to nf(M) then a normal order reduction will terminate in the normal form.

	
+--------------------------------------------------------------------+
|                                                                    |
|                 +--------------+*+-----------+                     |
|                 |                            |                     |
|                 |                            |                     |
|                 v                            v                     |
|    +-----------+*+----+                +----+*+---------+          |
|    |                  |                |                |          |
|    v                  v                v                v          |
| lambda x         lambda x          + lambda x+     +lambda x +     |
|    +                +              |         |     |         |     |
|    |                |              |         |     |         |     |
|    v                v              v         v     v         v     |
| lambda y         lambda y          x        x       x        x     |
|    +                +                                              |
|    v                v                                              |
|    x                y                                              |
|                                                                    |
|                                                                    |
+--------------------------------------------------------------------+

heed term *** follow lefthand branch of application


lambda z w . (lambda x y.x) w omega 
           !
		   ! beta 
		   V
lambda z w . (lambda y . w) omega 
           !
		   ! beta
		   V
(lambda z w . w)


Example of this:
(lambda x y . x x y) (lambda x . x y) z

+-----------------------------------------------------------------------+
|                                                                       |
|                                                                       |
|                                  +----------+*+--------------+        |
|                                  |                           |        |
|                                  |                           |        |
|                                  v                           v        |
|                  +-------------+ *+-----+                    z        |
|                  |                      |                             |
|                  |                      |                             |
|                  v                      v                             |
|               lambda                  lambda                          |
|                  +                      +                             |
|                  |                      |                             |
|                  v                      v                             |
|               lambda                +--+*+---+                        |
|                  V                  |        |                        |
|            +---+*+------>           v        v                        |
|            |            #0         #0       y                         |
|            v                                                          |
|       +---+*+-+                                                       |
|       |       |                                                       |
|       v       v                                                       |
|       #1     #1                                                       |
|                                                                       |
|                                                                       |
+-----------------------------------------------------------------------+

***Step by step in Lecture 13 reduction1.jpg


**NOTES FOR ASSIGNMENT

-Normal form <=> there no beta-reductions from the term
-head normal form <=> there are no head reductions.
-weak head normal form <=> no weak head reductions.

fixed point combinators
-----------------------

Y such that Yf =beta f (Yf)

 {Y = lambda f. (A f) (A f)
 {A = lambda f x. f(x x)
 **George fixed point combinator
 
 How to prove this is a fixed point combinator.
 
Yf := (lambda f.(Af)(Af))f
       ->beta (Af)(Af)
	   := ((lambda f x.f(x x))f) (Af) 
	   ->beta (lambda x . f(x x)) (Af)
	   ->beta f((Af)(Af))

f(Yf) := f((lambda f. (Af)(Af))f)
      ->beta f((Af)(Af))


CHurch-Rosser Theorem
----------------------

Two terms t1, and t2 are beta-equivalent iff there is a t with

t1         t2
 !         !
 !beta     ! beta
 !         !
  --->*<----
  
Confluence
----------
 
+------------------------------+
|                              |
|              t               |
|            +   +             |
|            |   |             |  EVERY DIVERGENCE 
|           *|   |*            |
|            |   |             |
|   t1 <-----+   +-----> t2    |
|   +                     +    |
|  *|                     |*   | HAS A CONVERGENCE
|   |                     |    |
|   +--------> t0 <-------+    |
|                              |
+------------------------------+


*lambda calculus is confluente under beta-reduction 

Encoding data in the lambda-calculus
------------------------------------

data Tree a = Tip 
             | Node a Tree a) (Tree a)


Tip := lambda t n. t 

Node a Tip Tip := Lamda n t. n a t t 

Node a (Node a' Tip Tip) Tip := lambda n t. n a(n a t t) t 

Node a t1 t2 = lambda n t . n a (t1 n t) (t2 n t)
-------------------------------------------------
--------------------------------------------------
Node = lambda a t1 t2 n t. n a (t1 n t) (t2 n t)

Foldtree::c->(a->c->c->c)->(Tree a)->c type of fold

case t
  Tip -> S1
  Node a t1 t2 --> s2          := case t s1 (lambda a t1 t2 . s2)

Pi1 (foldTree (Tip, s1)                                            )
    (          lambda a (t1,-) (t2,-) . (Node a t1 t2, s2 a t1 t2) )
	(	   t                                                       )
  
Defining Pairs:
---------------

 (t1, t2) := lambda f . f  t1 t2 
 
 PI0 (t1,t2) = t1
 Pi0 = (lambda z. z True)
 PI0 (t1,t2) := (lambda z.z True) (t1,t2)    := (lamba x y.x) t1 t2 
                -> beta (t1,t) True 		 ->beta (lambda y . t1) t2 
				:= lambda f. f t1 t2) True   ->beta (lamda y.t1) t2
				->beta True t1 t2            ->beta t1 
  
  
  
  -}