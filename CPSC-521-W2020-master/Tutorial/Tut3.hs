{-
Typeclasses in Haskell, therse are essentially the Haskell analogue of Interfaces from OO languages.
Ex.: Num typeclass, which has an addition, multiplication, and 0, 1.
(a*b)*c = a*(b*c)

Today: we want to cover Show, Eq, Ord, Iso

-}
data List a = Nil | Cons a (List a)


foldList :: (a -> b -> b) -> b -> List a -> b 
foldList _ z Nil = z
foldList f z (Cons x xs) = f x (foldList f z xs)


--First Show

instance Show a => Show (List a) where 
    -- show:: Show a => List a -> String
 show = showList1

showList1 :: Show a => List a -> String 
showList1 Nil = ""
showList1 (Cons x xs) = "[" ++ (show x) ++ showList' xs

showList' :: Show a => List a -> String
showList' Nil = "]"
showList' (Cons x xs) = ", " ++ (show x) ++ (showList' xs)


instance Eq a => Eq (List a) where 
  -- Exercise write Eq so that any two lists of equal length are equal 
  --(==) ::List a -> List a -> Bool
  (==) Nil Nil = True
  (==) Nil (Cons a as) = False
  (==) (Cons a as) Nil = False
  (==) (Cons x xs) (Cons y ys) = (x==y) && (xs == ys)

instance Ord a => Ord ( List a) where 
  --compare :: List a -> List a -> Ordering
  -- where data Ordering = EQ| LT | GT
  -- Exercise: implement the "L-\infty"- norm - only compare the maximun value of each list
  --EXAMPLE: [1,43,3] > [23,23,23,23,23,23]
  compare Nil Nil = EQ
  compare Nil (Cons x xs) = LT 
  compare (Cons x xs) Nil = GT 
  compare (Cons x xs) (Cons y ys) = compare (maxList (Cons x xs)) (maxList(Cons y ys))

maxList:: (Ord a) => List a -> a
maxList Nil = undefined
maxList (Cons x Nil) = x
maxLIst (Cons x xs) = max x (maxList xs)

--Next tutorial: Mondas and Applicative functors

instance Applicative (List a) where
  pure x = Cons x Nil 
  (<*>) _ Nil = Nil
  (<*>) Nil _ = Nil
  
  --<*> :: f (a -> b) -> f a -> f b