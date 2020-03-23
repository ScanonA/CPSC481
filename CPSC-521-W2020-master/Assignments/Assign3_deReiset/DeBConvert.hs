
-- -----------------------------------------
--           Juan Luis de Reiset          --
--             UCID: 30050167             --
--             Assignment III             --
--                CPSC 521                --
--                Winter 2020             --
--                                        --
--------------------------------------------

module DeBConvert where 

import Datatypes
import Data.List
import Data.Maybe

debConvert:: Eq a => Lam a -> Deb
debConvert l = debConv' [] l 

debConv':: Eq a => [a] -> Lam a -> Deb 
debConv' as (Abst a l) = DAbst  (debConv' (a:as) l) 
debConv' as (Var a) = case (myLookup a as) of
    -1 -> error "Unbound var"
    num -> DVar num
debConv' as  (App l1 l2) = DApp (debConv' as l1) (debConv' as l2)
debConv' as (Const a)  = DConst a
debConv' as (Add l1 l2) = DAdd (debConv' as l1) (debConv' as l2)
debConv' as (Mul l1 l2) = DMul (debConv' as l1) (debConv' as l2)
debConv' as (Eq  l1 l2) = Deq (debConv' as l1) (debConv' as l2)
debConv' as (Boolean bol) = DBoolean bol
debConv' as (If l1 l2 l3) = DIf (debConv' as l1) (debConv' as l2) (debConv' as l3)
debConv' as (Cons l1 l2) = DCons (debConv' as l1) (debConv' as l2)
debConv' as (Nil) = DNil
debConv' as (Case l1 l2 l3) = DCase (debConv' as l1) (debConv' as l2) (debConv' as l3)


myLookup:: Eq a => a -> [a] -> Int
myLookup a la = case (a `elem` la) of 
    True -> (fromJust (elemIndex a la))+1
    False -> -1
   
   