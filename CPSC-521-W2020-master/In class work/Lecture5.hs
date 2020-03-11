
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Lecture  V                  --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

{-
Finally the nonad:
instance Monad (Sm s) where
 return :: a -> (Sm s a)
 return a = Sm (\s -> (a,c))
 (>>=) :: (Sm s a) -> (a -> (Sm s b)) -> (Sm s b)
 
 u>>= f = Sm (\s ->((a,s') -> runSm (f a) s') (runSm u s))
 

Example:
 Numbering the variables of an expression:
  Opn "f" [Var "x", Var "y", Var "x"]
  
number_exp :: (Exp f v) -> (Sm Int (Exp f int))
number_exp (Var x)
 = do n <- Sm (\n -> (n,n+1))
   return (Var n)

number_exp (Opn f args)
 = do args' <- number_args args
   return (Opn f args')

number_args :: [(Exp f v)] -> ( Sm Int [(Exp f Int)]
number_args [] = return []
number_args (x:xs) = do x' <- number_exp x 
                     xs' <- number_args xs 
					 return (x':xs')


Renaming variables as integers
 Opn "f" [Var "sc", Var "y", Var "X"= ~~~~~> Opn "f" [Var 1, Var 2, Var 1]
 This is useful if you want to "standardize" the names of variables in a program / expression.
type ISubs v = [(v, Int)]
data SF a = SS a | FF 

subst:: Eq v => v -> Sm (ISubs v) Int
subst v = Sm (\subs -> case (insubs v subs) of
                       SS n -> (n, subs)
					   FF -> (next face v o subs))

insubs :: Eq v => v -> (ISubs v) -> (SF Int)
insubs v [] = FF
insubs v (w,m) : rest) | v ==w = SS m
                       | otherwise = insubs v rest 

Example:

next_free :: Eq v => v -> Int -> (ISubs v)-> (Int, Isubs v)
next_free v n [] = ((n,[(v,n)])
next_free v n ((w,m):rest) | n < m = (n,(v,n):(w,m):rest)
                           | otherwise = (\(p,subs') -> (p, (w,m):subs')) (m (next_free v (n+1) subs)

Renaming variables as integers

substexp :: Eq v => (Exp f v) -> ( Sm (ISubs v) (Exp f Int))
subst_exp (Var v) = do n <- subst v 
                    return (Var n)
subst_exp (Opn f args) = do args' <- subst_args args
                         return (Opn f args')
subst_args [] = return []
subst_args (t:Ts) = do t' <- subst_exp t
                    ts' <- subst_args ts 
					return (t':ts')
-}