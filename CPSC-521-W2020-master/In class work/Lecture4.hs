
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Lecture  IV                 --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

--Higher-order classes:
{-
The simplest one is the functor classes

class functor m where
  fmap: (a->b) -> (m a) -> (m a)

Instances of this class

(1) Lists  

instance Functor [] where
  fmap f [] = []
  fmap f (x:xs) = (f x):(fmap f xs)

(2) Success or fail datatype
data SF a = SS a 
            |FF
 deriving (Eq, Show)


instance Functor SF where
 fmap f (SS x) = SS (f x)
 fmap f FF = FF 

(3) Binary Trees:
data Tree a = Leaf a | Node (Tree a) (Tree a)
 deriving (Eq, Show)

instace Functor Tree where
 fmap f (Leaf a) = Leaf (f a)
 fmap f (Node t1 t2) = Node (fmap f t1, fmap f t2)

(4) 
data Exp f v = var v | Opn f [Exp f v]
 deriving (Eq, Show)

instance Functor (Exp f) where 
 fmap g (Var v) = Var (g v)
 fmap g (Opn f args) = Opn f fmap

The next higher order class (on the road to monads) is the "applicative class"
(this is a bit unnecessary as monads could be defined without them).

class (Functor m) => Applicative m where
 pew :: a -> m a
 (<*>) :: (m(a-->b)) -> (m a) -> (m b)
 

(1) Lists

instance Applicative [] where
 pwe a = [a]
 [] <*> _ = []
 (f:fs) <*> xs = (fmap f xs) ++ (fs <*> xs)
 
(2) for success or fail data type

instance Applicative sf where
 pwe x = SS xs
 FF<*>_ = FF
 _ <*> FF = FF
 (SS f) <*> (SS x) = SS (f x)
 
do syntax
f'<*> x' = do f<- f'
           x <- x'
		   return (f x)

(3) Trees 
instance Applicative Tree where
 pwe x = Leaf x 
 (Leaf f) <*> t = fmap f t 
 (Node tf1 tf2) <*> t = Node (tf1 <*> t) (tf2 <*> t )

  *                *
 / \     <*>      / \
 x1 x2            t1 t2 
 
     *
	/  \
   *    *
  / \  / \
 x1 x2 t1 t2 

(4) Expressions Exp f var
instance Applicative (Exp f) where 
 pwe v = Var var
 (Var g) <*> t = fmap g t
 (Opn f fargs) <*> t = Opn f (fmap (\farg -> farg <*> t) fargs)
 
 **f by convention, it could be any other letter, haskell assumes typing 

Higher-order classes:

The monad class 

class (Applicative m) => Monad m where 
 return :: a -> (m a)
 (>>=) :: (m a) -> (a -> m b) -> m b 
 
 where (>>=) is a sequencer

(1) Lists
instance Monad[] where
 return x = [x]
 [] >>= f = []
 (a:as) >>= f = (f a) ++ (as >>= f)
 
 ** You can also write that last line as
 as >>= f = Conc (fmap f as)

(2)For Success or fail data type
instance Monad SF where
 return x = SS x
 FF>>= f = FF 
 **f:: a-> SF b)
 SS a>>= f = f a 

(3) Expressions 
instance Monad (Expn f) where 
 return v = Var v 
 (Var v)>>=f = f v
 (Opn h args)>>= f = Opn h (fmap(\args-> args>>= f) args
 
Think of f as giving a substitution
Consider Exp String String and the function 
f t v | v == "x" = t 
      | otherwise = var v 

The do syntax
sfList :: [SF a] -> SF [a]
sfList [] = SS []
sfLIst (a:as) = do a' <- a 
                   as' <- sflist as 
				   return (a':as')

Translation of the do syntax:
[[ do {r} ]] = r 
[[ do {x<- p;c;r} ]]= p>>=(\x -> [[ do {c;r] ]]
[[ do {r';c;r} ]] = r'>>=(\_ -> [[ do {c;r} ]]

Translation the sfList example:
[[ do {a' <- a; as' <- sflist as; return(a':as')} ]]
= a>>= (\a -> [[ do{as'<-sflist as; return(a':as') ]] )
= a>>= (\a -> (sflist as)>>=(\as'-> return (a':as')))

Now use the SF monad definition to translate to basic syntax
xase a of SS a' -> case as of 
  SS as' -> SS (a':as')
  FF -> FF
 FF -> FF 

-}