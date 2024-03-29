{- |
Module      : Ch05.Ex08
Description : 練習問題 5.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @positions@ を関数 @find@ を使って再定義してください．

-}
module Ch05.Ex08 where

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

