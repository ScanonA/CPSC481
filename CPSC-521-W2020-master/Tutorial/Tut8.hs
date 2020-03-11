
{-
strict induction

Nat : M-> x |lambdax M| (lambda x . M) |MM

Base case . Var x
 individual step holds for terms < n
 T.size n+1
   -lambda x . M 
   - (lambda x . M) N 
   -MN


Printer monad as defined by:

data Printer a s = Print [a] s 

instance Monad (Printer a) where
 return s = Print [] s
 (Print as s) >>= f case f s of Print bs s' -> Print (as++bs) s'
 
 pput str = Print str()
-}