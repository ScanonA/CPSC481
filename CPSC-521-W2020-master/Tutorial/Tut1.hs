
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Haskell Tut I         --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

lengthh :: [a] -> Int
lengthh [] == 0
lengthh (x:xs) = 1 + (lengthh xs)

data List a = Nil 
 | Cons a (List a)
 deriving (Eq, Show)


lengthList :: List a -> Int
lengthList Nil = 0
lengthList (Cons x xs) = (\ u v -> v+1) x (lengthList xs)


foldList :: (a-> b -> b) -> b -> List a -> b
foldList f z Nil = z
foldLIst f z (Cons x xs) = f x (foldList f z xs)

--Exercise
lengthList' :: List a -> Int
lengthList ' = foldList (\u v -> v+1) 0

--Exercise:
app :: (List a,List a) -> List a
app x y = foldList _ _ (Cons 1 (Cons 2 Nil)) (Cons 1 (Cons 2 Nil)) = Cons 1 (Cons 2 (Cons 3 Nil))

-- app(Cons 1 (Cons 2 Nil), Cons 3 Nil) = Cons 1 (Cons 2(Cons 3 Nil))


--Exercise:: FOLDL (foldleft)
foldLeft :: (b -> a -> b) -> b -> [a] -> b
foldLeft f z Nil = z
foldLeft f z (Cons x xs) = foldLeft f ( f z x) xs 

--Exercise write reverse using foldLeft 
reverse:: List a -> List a
reverse Nil = Nil
reverse Cons x (xs) = foldLeft (\a
