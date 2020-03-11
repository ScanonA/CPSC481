
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Lecture  III                --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

{-
The plan:

List comprehension (how it gets translated Haskell Class System
Haskell Class system
Ho classes
futors 
and monads

-}

pairs :: [a] -> [b] -> [(a,b)]
pairs l1 l2 = [(x,y)| x <- l1, y <- l2]

{-
The translation for list comprehension :

[[ [e|] ]] = [e]
[[ [e| x <- t, rest] ]] = conc(map(\x -> [[ [e|Rest] ]])
[[ [e|p,rest] ]] = if p then [[ [e|rest] ]] else []

conc: [[a]] -> [a]
[[ [(x,y) | x <- l1, y <- l2] ]]
 = conc (map(\x -> [[ [(x,y)| y <- l2] ]]) l1)
 = conc (map(\x -> conc(map (\y-> [[ [(x,y)| ] ]])l2))l1)
 = conc (map(\x -> conc(map (\y->  [(x,y)])l2))l1)

-}
{-

RECURSIVE IMPLEMENTATION
filter2:: (a ->Bool) -> [a] -> [a]
filter2 p [] =[]
filter2 p [x:xs] | p a = x: (filter2 p xs)
                | otherwise =  filter2 p xs

-}
filter2:: (a ->Bool) -> [a] -> [a]
filter2 p l = [a | a<-l , p a]

{-
Translation to concat map 

= conc (map (\a -> [[ [a|p a] ]]) l )
= conc (map (\a -> if p a then [[ [a| ] ]] else [])l)
= conc (map (\a-> if p a then [a] else [])l)
-}
 
{-
Pythagorean triplets

   |\
 x | \ z
   |_ \
     y

X^2+y^2 = z^2

want to enumarate all Pythagorean triples up to x,y,z <N	 
-}

pyth :: Integer -> [(Integer,Integer,Integer)]
pyth n = [(x,y,z) | z <- [1..n], x <- [1..z], y <- [1..x], pythag_cond x y z]
                    where pythag_cond x y z = (x*x + y*y == z*z)


{-
Haskell class systemAllows "ad hoc" polymorphic functions such as 

From latin polymorphism. Poly = many, morphism= face. == Many faces

(==) : a -> a -> Bool
Note that there is no equality test for the type a = Nat -> Nat 
Also for =<

=< :: a -> a -> Bool but not every type has an (total) order

Haskell allows one to define a set types for which the equality test can be used. This is called the "equality class"

class Eq a where
  (==) :: a -> a -> bool
   (=/=) :: a -> a -> bool
   a =|= b = not (a==b)
   
   

-}