-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--            Lecture  VI                 --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------


{-Subsitution

 t[s/x] the term t with s substituted for x.
 
 example x x [ labda y *y/x] = (labda y * y) (labda y * y)
 
 There is an important compication called "variable capture"
 
 (lambda x * y x) [x x/y] =/ lambda x (xx) x 
 
 lambda * y o [xx/y] = lambda * (xx) o
 
 
 Substitution using variables (avoiding variable capture!)
 
 - x [s/x] = s 
 - x [s/y] = x when x=/y
 -(t1 t2) [s/x] = t1[s/x] t2[s/x]
 -(lambda y * t) [s/x] = { y not element of forever S lambda y * t[s/x]
                           y = x              lambda y * t
						   y element of forever S then x convert chosse a variable z
						   and then form  (lambda z * t [z/y]) [s/x]
						   
   (lambda x * y x) [(xz * zx)/y]
   alpha-convert alpha is free variable
   


Beta-equality
-------------

(lambda x * t) s ≡beta t [s/x]

abstractions applied to a term one can beta-reduce it by substitution.

Put beta-equality is also true in context: 

The lambda-calculus
-------------------



						   
-}