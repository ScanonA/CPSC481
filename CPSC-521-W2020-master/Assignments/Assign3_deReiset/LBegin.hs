

module LBegin where

import Datatypes
import DeBConvert
import CodeConvert
import Machine
import Data.List
import Data.Maybe



lambdaBegin:: Eq a => Lam a -> [String]
lambdaBegin lam = out where
    dConv = debConvert lam
    cCode = codeConvert dConv
    out = prettyMachine (cCode, [], [])
