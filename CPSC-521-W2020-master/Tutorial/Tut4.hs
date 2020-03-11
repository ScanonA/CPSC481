
instance Functor SF where
 fmap f FF = FF
 fmap f (SS a) = SS (f a)

plus5 = (+) 5

safeLogPlus5 = (fmap plus 5) . safeLog 

instance Applicative SF where
 pure = SS 
 FF <*> _ = FF
 _ <*> FF = FF 
 (SS f) <*> (SS x) = SS (f x)

instance Monad SF where 
 return = pure
 --(>>= :: SF a -> (a -> SF b) -> SF b
 (>>=) x f = maybeFlatten . (fmap f)
 --( fmap f) x :: SF (SF x)
 -- maybeFlatten . (fmap f) :: a -> SF b

maybeFlatten :: SF (SF a) -> SF a
maybeFlatten FF = FF
maybeFlatten (SS FF) = FF
maybeFlatten (SS (SS x)) = SS x