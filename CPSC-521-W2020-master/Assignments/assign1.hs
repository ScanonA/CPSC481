
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Haskell Exercices I         --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

--1. append function and reverse list function with and without a Datatype

--Basic functions
app :: ([a],[a]) -> [a]
app ([], xs) = xs
app ((e:es), xs) = e : (app (es, xs))

rev :: [a] -> [a]
rev = reve []
   where reve acc [] = acc
         reve acc (x:xs) = reve (x:acc) xs

--With Datatypes
data List a = Nil 
 | Cons a  (List a)
  deriving (Eq, Show)

foldList :: (a-> b -> b) -> b -> List a -> b
foldList f z Nil = z
foldLIst f z (Cons x xs) = f x (foldList f z xs)
  
appL :: (List a, List a) -> List a
appL (x, y) = foldList Cons y x

foldLeft :: (b -> a -> b) -> b -> List a -> b
foldLeft f z Nil         = z
foldLeft f z (Cons x xs) = foldLeft f (f z x) xs


revL:: List a -> List a
revL = foldLeft (flip Cons) Nil


 
--4. function to determine whether its first argument, a list of integers, is lexicographically larger than its second argument:
lexInt::[Int] -> [Int] -> Bool
lexInt (x:xs) (y:ys)| x > y = True
                    | y > x = False
                    | x == y = lexInt xs ys

lexIntL:: Ord a => [a] -> [a] -> Bool 
lexIntL xs [] = True
lexIntL [] ys = False
lexIntL (x:xs) (y:ys)| x > y = True
                    | y > x = False
                    | x == y = lexIntL xs ys

instance Ord a => Ord ( List a) where 
  compare Nil Nil = EQ
  compare Nil (Cons x xs) = LT 
  compare (Cons x xs) Nil = GT 
  compare (Cons x xs) (Cons y ys) = compare (maxList (Cons x xs)) (maxList(Cons y ys))

maxList:: (Ord a) => List a -> a
maxList Nil = undefined
maxList (Cons x Nil) = x
maxLIst (Cons x xs) = max x (maxList xs)

lexIntList:: Ord a => List a -> List a -> Bool 
lexIntList (Cons x xs) Nil = True
lexIntList Nil (Cons x xs) = False
lexIntList (Cons x xs) (Cons y ys)| x > y = True
                                  | y > x = False
                                  | x == y = lexIntList xs ys



--5.  merge sort in Haskell:
msplit:: [a] -> ([a],[a])
msplit [] = ([], [])
msplit [x] = ([x], [])
msplit (x:y:xs) = (x:xp, y:yp) where (xp, yp) = msplit xs

merge :: (Ord a) => [a] -> [a] -> [a]
merge a [] = a
merge [] b = b
merge (a:as) (b:bs)
  | a < b     = a:(merge as (b:bs))
  | otherwise = b:(merge (a:as) bs)

mergesortInt :: [Integer] -> [Integer]
mergesortInt [] = []
mergesortInt [a] = [a]
mergesortInt a = 
  merge (mergesortInt firstFew) (mergesortInt lastFew)
    where firstFew = take ((length a) `div` 2) a
          lastFew = drop ((length a) `div` 2) a

mergesort ::(Ord a) => [a] -> [a]
mergesort [] = []
mergesort [a] = [a]
mergesort a = 
  merge (mergesort firstFew) (mergesort lastFew)
    where firstFew = take ((length a) `div` 2) a
          lastFew = drop ((length a) `div` 2) a


--6. quicksort for an arbitrary ordered type:

quicksort :: (Ord a) => [a] -> [a]
quicksort [] =  []
quicksort (p : as) =  quicksort [ a | a <- as, a < p ] ++ p : quicksort [ a | a <- as, p <= a ]



--7.Write a function which determines whether an element (of equality type) is in a list
member :: (Eq a) => a -> [a] -> Bool
member x [] = False
member x (y:ys) | x==y = True
                | otherwise = member x ys

--9. Program the "group" function: given a predicate pred:: a -> a -> Bool and a list the group function 
--breaks the list into a series of (maximal) sublists such that any two consecutive elements 
--satisfy the predicate pred.   The type of the function group is group:: (a -> a -> Bool) -> [a] -> [[a]]. 
-- An example of its use is as follows: suppose that the predicate nbr determines whether the
-- absolute difference of two integers is at most 1 (i.e. they are equal or they differ by one)
-- then group nbr [2,1,3,4,5,5,4,7,4,3,3] = [[2,1],[3,4,5,5,4],[7],[4,3,3]] :
-- program up this example to make sure your group works.  What is group nbr []?

group:: (a -> a -> Bool) -> [a] -> [[a]]
group p lst = foldr f [[]] lst
               where
               f n [[]] = [[n]]
               f n ((x:sublst):rest)   | (p n x) = ((n:(x:sublst)):rest)
                                       | otherwise = [n] : ((x:sublst):rest)
nbr :: Int -> Int -> Bool
nbr num1 num2 = abs (num1 - num2) <= 1

--11.function which given a list returns the list of all permutations of that list: 

perm :: [a] -> [[a]]
perm []     = return []
perm (x:xs) = (perm xs) >>= (inse x)       --inse is the Monad used to apply letter in words recursively
    where
    inse :: a -> [a] -> [[a]]
    inse x []     = [[x]]
    inse x (y:ys) = [x:y:ys] ++ ( map (y:) (inse x ys) )

--12. Given a permutation it is possible to give its cyclic decomposition. For example the permutation [2,4,5,1,3] of [1,2,3,4,5] 
--can be represented as [[1,2,4],[3,5]] where this indicates that each element becomes its righthand neighbor unless it is at the
-- end of a sublist in which case it goes to the first in the sublist.
-- Give the list of all permutations represented by their cyclic decompositions.


--15. Write a function for normalizing, adding, and multiplying multivariable polynomials. 
-- You may represent the polynomials as lists of real numbers paired with a list of powers, 
--[(Float,[Int])], for each variable so [(1.5,[0,0,0]),(3.2,[0,1,1]),(4.7,[2,2])] = 1.5 + 3.2yz +4.7x^2y^2.  
-- To normalize a polynomial one places entries so the power lists are in lexicographical order and one amalgamates any repeated terms: 
--normpoly:: [(Float,[Int])] -> [(Float,[Int])].   
--To add polynomials we have addpoly:: [(Float,[Int])]  -> [(Float,[Int])] -> [(Float,[Int])] and 
--to multiply polynomials multpoly:: [(Float,[Int])]  -> [(Float,[Int])] -> [(Float,[Int])].

normpoly:: [(Float,[Int])] -> [(Float,[Int])]
normpoly [] = undefined


--18.

--My way to calculate factorial    //All the code for question 18 reference my past exersise 1 from CPSC 449
myFac :: Integer -> Integer
myFac 0 = 0
myFac 1 = 1
myFac x = x * myFac (x-1)

--Different ways to calculate factorial
{-
//This is a simple but not so efficient way to calculate it
fac n = if n == 0 
           then 1
           else n * fac (n-1)
// A more efficient approach as Ivavor Diatchkis represent would be the equivalent of sophomore
haskell programmer

fac = (\(n) ->
        (if ((==) n 0)
            then 1
            else ((*) n (fac ((-) n 1)))))
 
// Another simple implementation
fac 0 =1
fac (n+1) = (n+1) * fac n

// using foldr
fac n = fold (*) 1 [1..n] 

// Interactive one line implementation using.
fac n = snd (until ((>n) . fst) (\(i,m) -> (i+1, i*m)) (1,1))

//Haskell implementation using combination of functions
s f g x = f x (g x)

k x y   = x

b f g x = f (g x)

c f g x = f x g

y f     = f (y f)

cond p f g x = if p x then f x else g x

fac  = y (b (cond ((==) 0) (k 1)) (b (s (*)) (c b pred)))

-}


--19.Given a Rose tree with values at the auguments of the nodes ( data Rose a = RS [(a,Rose a)] ) 
--use a fold to calculate the width of a Rose Int tree (that is in the undirected graph of the tree with 
--weighted edges, the width is the length of the longest path),  width:: Rose Int -> Int.
 
data Rose a = RS [(a, Rose a)]

foldRose :: ([(a, c)] -> c) -> Rose a -> c
foldRose g (RS args) = g (map (\(a, arg) -> (a, foldRose g arg)) args)


high []     = 0
high args   = maxlist args


maxlist ((x,y):[])  = x + y
maxlist ((x,y):xs)  = max (x + y) (maxlist xs) 

width (RS xs) = foldRose high (RS xs)

