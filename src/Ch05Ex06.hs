{- |
Module      : Ch05Ex06
Description : 『プログラミングHaskell第2版』練習問題 5.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

自分自身を除く約数の和が自分自身と等しいとき，その整数を完全数と呼びます．
与えられた上限までに含まれる完全数すべてを算出する関数 @perfects :: Int -> [Int]@ を
リスト内包表記と関数 factors を使って定義してください．
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
