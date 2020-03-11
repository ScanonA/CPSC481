--State monad

state thing a 
thing -> (thing, a)

b -> state thing a 


alpha-renaming

(int, int)
{fn :: int, vn ::int}

--------------------------------------
[Fun] -> state (int,int) Fun
xs= do 
(fn, vn) <- get
let vs = zip (fun.symbols xs)  [v..]  ----  fun.simbols = [x| (Fun (x,_,_) <- xs]
let new_funs = foldr (\sub funs -> map (substitute_f sub) funs) vs