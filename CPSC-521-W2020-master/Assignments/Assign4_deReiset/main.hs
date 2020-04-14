module Main where

import Datatypes   
import BuildEquations
import SolveEquations
import Data.List
import Data.Maybe
import System.Environment

main = do
    args <- getArgs
    let fname = args !! 0
    test <- readFile fname
    let type1 = (infer (read test))
    putStrLn (showType type1)
    
