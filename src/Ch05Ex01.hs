{- |
Module      : Ch05Ex01
Description : 『プログラミングHaskell第2版』練習問題 5.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リスト内包表記を使って， 1 から 100 までの二乗の和 1^2 + 2^2 + ... + 100^2 を計算する式を考えてください．
-}
module Ch05Ex01 where

{- |
  2乗の和
-}
sumSquare :: [Int] -> Int
sumSquare xs = sum [ x ^ 2 | x <- xs ]
