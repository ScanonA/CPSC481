
--Midterm Review

{-
What does it mean for two alpha terms to be beta equivalent?
Is it possible to decide wether two terms are beta-equivalent? NO

When is a term in beta normal form? There is no more beta reductions to make.

Explain why each alpha term is beta equivalent to at mos one beta normal form.

2.  (35 points) Consider the following Haskell code:
data Exp f v = Var v | App f [Exp f v]
instance Monad (Exp f) where
    return x = Var x
	Var x >>= f = f x
	(App g args) >>= f = App g (map (\e -> e>>=f) args)
subst::Eq v => (v,Exp f v) -> (Exp f v) -> (Exp f v)
subst (x,t) s = do y <- s
     if x==y then t else return y
substs:: Eq v => [(v,Exp f v)]  -> (Exp f v) -> (Exp f v)
substs subs t = foldlist (\sub s -> subst sub s) t subs

(a)  (5 points) Explain how this code implements substitution.



-}