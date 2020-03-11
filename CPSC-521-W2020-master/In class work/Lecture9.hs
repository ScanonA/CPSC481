

{-

Representing data in the lambda calculus
-----------------------------------------

Bool ok
Pairing ok

Nat  Predecesor
     case construct
	 
	 
Case construct for N:

case n of
 zero --> t1 := Case N n t1 (lambda n t2) := pi1 (fold <zero1 t1> (lambda <x0,x1>. <succ x0, f x0>)n)
 succ n --> t2 


Representing lists in the lambda calculus
------------------------------------------

[] = lambda c0 c1 . c0
[x1] = lamba c0 c1 . c1 x1 x2
[x1 x2] = lambda c0 c1 . c1 x1 (c1 x2 c0)
[x1 x2 x3] = lambda c0 c1 . c1 x1 (c1 x2 (c1 x3 c0))


Cons x1 (Cons x2 Nil) := (lambda x y c0 c1 . c1 x (y c0 c1)) x1 (Cons x2 Nil)
*
--> lambda c0 c1 . c1 x1 ((Cons x2 Nil) c0 c1)
b

:= lambda c0 c1 . c1 x1 ((lambda x y c0 c1 . c1 x ( y c0 c1)) x1 Nil (c0 c1)

*
--> lambda c0 c1 . c1 x1(c1 x2 ( Nil c0 c1))
b

:= lambda c0 c1 . c1 x1 ( c1 x2 (oambda c0 c1 . c0 c1))

*
---> lambda c0 c1 . c1 x1 (c1 x2 c0)
b



The fold for Lists
---------------------

foldList n f l := l n fold                 Now you can write append, flatten
         ^ ^ ^
	   constant
	     function
		    list                                The case construct for lists:

foldlist :: c -> (a -> c -> c) -> [a] -> c       case l of 
                                                   Nil --> t1  := case list l t1 lambda a as . t2 
												   cons a as --> t2 
--------------------------------------------

caselist l t1 f := pi0( (foldList <t1 , Nil> (lambda a <_,l> . <f a l', cons a l'>)l)

Representing trees:
   data Tree a = Leaf a | Node (Tree a) (Tree a)

It would look like this:
+-------------------------------------+
|                                     |
|                + * +------->* +     |
|                |            + |     |
|                |            | |     |
|                |            | |     |
|                |            | |     |
|        Leaf<---+            | |     |
|         +                   | |     |
|         |                   | |     |
|         |           Leaf <--+ |     |
|         v             a2      |     |
|         a1                    v     |
|                             Leaf    |
|                               a3    |
|                                     |
+-------------------------------------+


Leaf a := lambda c0 c1 . c0 a 
Node (Leaf a1) (Leaf a2) := lambda c0 c1 . c1 (c0 a1) (c0 a2)
Node (Node (Leaf a1) (Leaf a2)) (Node (Leaf a3) (Leaf a4))
            := lambda c0 c1 . c1 (c1 ( c0 a1) (c0 a2)) (c1 ( c0 a3) (c0 a4))

The constructor for trees:

Leaf a := lambda c0 c1 . c0 a1
Leaf := lambda a c- c1 . c0 a 

Node t1 t2 := lambda c0 c1 . c1 (t1 c0 c1) (t2 c0 c1)
Node := lambda t1 t2 c0 c1 . c1(t1 c0 c1) ((t2 c0 c1)

The fold for trees:
 foldTree fleaf fnode t
    := t fleaf fnode
	
The case for trees 
------------------

case t of 
  Leaf a --> s1           :=case Tree t (lambda a. s1) (lambda t1 t2. s2)       lambda <_,s1> <_,s2> . <g s1 s2, Node s1 s2>
  Node t1 t2 --> s2       case Tree t f g :=                                    ^
                             pi1 (foldTree                                      |
							           (lambda a . <f a, Leaf a>)               |
									   (lambda t1 t2 . <g (p1 t1) (p1, t2), Node (pi1 t1) (pi 2 t2)>)
									   t)


For a general datatype:
 1) data D a1 ... an = | Cons1 (T11 a1.. an (Da1 .. an)) .. (Tm1 a1 .. an (D a1 ..an))
                       | Cons p (Tp1 a1 .. an (D a1 .. an) ... (tpmp a1 .. an (Da1..an))
					 

This means the constructor has type
   cons i :: (Ti1 a1 .. an (D a1 .. an)) -> ... -> (Ti mi a1 .. an (D a1 .. an)) -> D i a1 .. an

2) We need the map function for each type constructor Ti j
   
   f::x --> y 
-----------------------------------------------------------
  Map Tij f :: (T ij a1 .. an x) --> (Tij a1 .. an y)
  

3) We borrow the form of the fold function 
   fold 0 c1.. cp d = d c1 .. cp           *** This is always simple
                                               the trick is in how the constructor is defined!

4) Cons1 y1 .. ymi  := lambda c1 ... cp . ci (Map Tii (lambda y . y c1.. cp)y1) ... (Map Tmi (lambda y . y c1 .. cn) yn=mi)


Representing rose trees
-----------------------

   data Rose f v = Var v | Rs f [Rose f v]

   Var x := lambda v r. v x 
   Var := lambda x v r. v x0
  Rs f l := lambda v r . r f (MapList (lambda t . t v r) l )
  Rs = lambda f (v r . r f (MapList (lambda t . t v r) l)



-}