{- |
Module      : Ch05Ex08
Description : 『プログラミングHaskell第2版』練習問題 5.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch05Ex08 where

{- |
  @find@ を用いた @positions@ の定義

@
 positions :: Eq a => a -> [a] -> [Int]
 positions x = find x . flip zip [0..]
@

>>> positions False [True, False, True, False]
[1,3]
-}
positions :: Eq a => a -> [a] -> [Int]
positions x = find x . flip zip [0..]

find :: Eq a => a -> [(a, b)] -> [b]
find k t = [ v | (k', v) <- t, k == k' ]

