
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--             Assignment III             --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

module Datatypes where 


data Lam a = Var a 
        | Abst a (Lam a) 
        | App (Lam a) (Lam a)
        | Const Int
        | Add (Lam a) (Lam a)
        | Mul (Lam a) (Lam a)
        | Eq (Lam a) (Lam a)
        | Boolean Bool
        | If (Lam a) (Lam a) (Lam a)
        | Cons (Lam a) (Lam a)
        | Nil
        | Case (Lam a) (Lam a) (Lam a) deriving (Eq, Show, Read)

data Deb  = DVar Int
        | DAbst (Deb)
        | DApp (Deb) (Deb)
        | DConst Int 
        | DAdd (Deb) (Deb)  
        | DMul (Deb) (Deb)
        | Deq (Deb) (Deb)
        | DIf (Deb) (Deb) (Deb)
        | DBoolean Bool
        | DCons (Deb) (Deb)
        | DNil
        | DCase (Deb) (Deb) (Deb) deriving (Eq,Show, Read)
        
data Code =  Clo [Code]
        | CApp
        | CAccess Int
        | CRet
        | CConst Int
        | CAdd
        | CMul
        | CLeq
        | CBoolean Bool
        | CNil
        | CCons
        | CCase ([Code],[Code])
        | CIf ([Code],[Code]) deriving (Eq, Show)
        
data Stack = SInt Int
        | SBoolean Bool
        | SNil 
        | SCons (Stack, Stack)
        | SClos ([Code],[Stack]) deriving (Eq,Show)


--(\x.xx)(\x.x)
test1 = App (Abst "x" (App (Var "x")(Var "x"))) (Abst "x"(Var"x"))

--(\xy.xy)(\x.x)(\y.y)
test2 = App (App (Abst "x" (Abst "y" (App (Var"x")(Var "y")))) (Abst "x" (Var "x"))) (Abst "y" (Var "y"))
--(\x.x +1)2
test3 = App (Abst "x" (Add (Var "x" ) (Const 1))) (Const 2)


--fixPoint = (\f.(\a.f(\x.aax))(\a.f(\x.aax)))
fixpoint = (Abst "f" (App(Abst "a" (App (Var "f")(Abst "x" (App(App (Var "a")(Var "a"))(Var "x")))))(Abst "a" (App (Var "f")(Abst "x" (App(App (Var "a")(Var "a"))(Var "x"))))))) 

--factorial lambdaFunction
m_factorial = (Abst "f" (Abst "n" ((If(Eq(Var "n")(Const 0))(Const 1)(Mul(Var "n")(App(Var "f")(Add(Var "n")(Const (-1)))))))))

--ifTest
ifTrue = App (Abst "x" ((If (Boolean True)(Mul(Var "x")(Var "x"))(Add(Var "x")(Var "x")))))(Const 3)

--ifTest
ifFalse = App (Abst "x" ((If (Boolean False)(Mul(Var "x")(Var "x"))(Add(Var "x")(Var "x")))))(Const 3)

--caseTest
caseT = App(Abst "x" (Case (Var "x") (Mul(Var "x")(Var "x"))(Add(Var "x")(Var "x"))))(Cons(Const 4)(Nil))

--Omega: Infinite loop, wont stop
omega = App (Abst "x" (App (Var "x")(Var "x")))(Abst "x" (App(Var "x")(Var "x")))
