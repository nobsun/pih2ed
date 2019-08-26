{- |
Module      : Ch05Ex06
Description : 『プログラミングHaskell第2版』練習問題 5.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch05Ex06 where

{- |
  完全数

>>> perfects 500
[6,28,496]
-}
perfects :: Int -> [Int]
perfects m = [ x | x <- [1 .. m], sum (factors x) == 2 * x ]

{- |
  素因数
-}
factors :: Int -> [Int]
factors n = [ y | y <- [1 .. n], n `mod` y == 0 ]
