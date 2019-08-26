{- |
Module      : Ch04Ex07
Description : 『プログラミングHaskell第2版』練習問題 4.7
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下のカリー化された関数の定義の意味をラムダ式を用いて形式化してください．

@
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z
@

-}
module Ch04Ex07 where

{- |
  3つの整数の積

@
mult :: Int -> Int -> Int -> Int
mult = \ x -> \ y -> \ z -> x * y * z
@

>>> mult 2 3 4
24

-}
mult :: Int -> Int -> Int -> Int
mult = \ x -> \ y -> \ z -> x * y * z
