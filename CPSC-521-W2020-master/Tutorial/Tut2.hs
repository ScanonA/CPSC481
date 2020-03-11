data Tree a = Leaf a | Node (Tree a) (Tree a)
 deriving (Show, Eq)
 
foldTree :: (b -> b -> b)->(a -> b)->Tree a-> b
foldTree _ lfun (Leaf x) = lfun x
foldTree nfun lfun (Node tl tr) = nfun (foldTree nfun lfun tl) (foldTree nfun lfun tr)

sumTree :: (Num a) => Tree a -> a
sumTree=foldTree (+) id

--Q1: Write maxTree:: (Ord a) => -> a 
--Q2: Write treeToList :: Tree a -> List a

maxTree :: (Ord a) => Tree a -> a
maxTree = foldTree max id 

treeToList :: Tree a -> [a] 
treeToList = foldTree (++) (\x -> [x])

data NonEmptyList a = Cons a (NonEmptyList a) | End a

foldNonEmpty :: (a -> b -> b) -> (a -> b) -> NonEmptyList a -> b
foldNonEmpty fc fe (End a) = fe a
foldNonEmpty fc fe (Cons a as) = fc a (foldNonEmpty fc fe as) 


--Exercise: Write maxList, listToTree

maxList :: (Ord a) => NonEmptyList a -> a 
maxList = foldNonEmpty max id 

--listToTree :: NonEmptyList -> Tree a 
--lisToTree = undefined

class Ord a => BotOrd a where
 minElem :: a 

instance BotOrd Int where
 minElem = -100000

maxList' :: (BotOrd a) => [a] -> a-
maxList' = foldr max minElem 