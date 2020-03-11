
{-
monad m 
 return :: a -> m a
 (>>=) :: m a -> (a-> m b) -> m b
 <*> :: m a -> m (a -> b) -> m b
 (>>) :: m a -> m b -> m b
 x >> y = x>>=(\_ -> y)
 

hold = []
foreach x in xs
 for y in ys:
  if(x < y)
   hold.app((x,y))
  (pair xs ys = do {
                x <- xs;
				y <- ys;
				if x < ys
				then return  (x,y)
				else []}
-}

lpair xs ys = 
  do {
   x <- xs;
   y <- ys;
   if (x < y)
    then return (x,y)
    else [];
   if (y > x)
    then return (x*x, y)
    else [];
  }

--Exercise: write a list comprehension associate to this program


lpcomp xs ys = [(x,y) | x <- xs, y <- ys, x < y]

main = do 
 x <- getLine;
 putStrLn $ x ;
 x <- getLine;
 putStrLn $ x ;
 putStrLn "ipjfaf";
 

--Translating bind operator
 [max x y| x<- xs , y <- ys, (x + y)>0 ]
 
 xs  >>=(\x ->  
  ys >>= (\y -> 
   if (x+y > 0) then return (max x y)
                else []   
