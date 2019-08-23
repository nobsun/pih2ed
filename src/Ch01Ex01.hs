{- |
Module      : Ch01Ex01
Description : 『プログラミングHaskell第2版』練習問題 1.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@double (double)@ の結果を算出する別の計算方法を考えましょう．
-}
module Ch01Ex01 where

{- |
  式
-}
data Term
  = Num Int
  | Double Term
  | Add Term Term

instance Show Term where
  showsPrec _ t = case t of
    Num m -> shows m
    Double t -> ("double" ++) . space . shows' t
    Add t1 t2 -> shows' t1 . space . ('+' :) . space . shows' t2
    where
      shows' t = case t of
        Num _ -> shows t
        _     -> open . shows t . close
      space = (' ' :)
      open  = ('(' :)
      close = (')' :)

{- $setup
>>> sample = Double (Double (Num 2))
>>> print sample
double (double 2)
-}

{- |
  簡約系列

>>> mapM_ print (redSeqs sample)
[double (double 2),(double 2) + (double 2),(2 + 2) + (double 2),4 + (double 2),4 + (2 + 2),4 + 4,8]
[double (double 2),(double 2) + (double 2),(2 + 2) + (double 2),(2 + 2) + (2 + 2),4 + (2 + 2),4 + 4,8]
[double (double 2),(double 2) + (double 2),(2 + 2) + (double 2),(2 + 2) + (2 + 2),(2 + 2) + 4,4 + 4,8]
[double (double 2),(double 2) + (double 2),(double 2) + (2 + 2),(2 + 2) + (2 + 2),4 + (2 + 2),4 + 4,8]
[double (double 2),(double 2) + (double 2),(double 2) + (2 + 2),(2 + 2) + (2 + 2),(2 + 2) + 4,4 + 4,8]
[double (double 2),(double 2) + (double 2),(double 2) + (2 + 2),(double 2) + 4,(2 + 2) + 4,4 + 4,8]
[double (double 2),double (2 + 2),(2 + 2) + (2 + 2),4 + (2 + 2),4 + 4,8]
[double (double 2),double (2 + 2),(2 + 2) + (2 + 2),(2 + 2) + 4,4 + 4,8]
[double (double 2),double (2 + 2),double 4,4 + 4,8]
-}
redSeqs :: Term -> [[Term]]
redSeqs t = case step t of
  [] -> [[t]]
  ts -> map (t:) (concatMap redSeqs ts)

{- |
  1ステップ簡約

>>> print (step sample)
[(double 2) + (double 2),double (2 + 2)]
-}
step :: Term -> [Term]
step t = case t of
  Num _    -> []
  Double u  -> Add u u : [ Double v | v <- step u ]
  Add t1 t2 -> case t1 of
    Num i1    -> case t2 of
      Num i2   -> [Num (i1+i2)]
      _        -> [Add t1 u2 | u2 <- step t2]
    _          -> [Add u1 t2 | u1 <- step t1] ++ [Add t1 u2 | u2 <- step t2]
