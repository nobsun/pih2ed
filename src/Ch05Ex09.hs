{- |
Module      : Ch05Ex09
Description : 『プログラミングHaskell第2版』練習問題 5.9
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

二つのリストから内積を計算する関数 @scalarproduct :: [Int] -> [Int] -> Int@ を
関数 @chisqr@ と同じようにリスト内包表記を使って定義できることを示してください．

-}
module Ch05Ex09 where

{- |
  内積

@
 scalarproduct :: [Int] -> [Int] -> Int
 scalarproduct xs ys = sum [ x * y | (x, y) <- zip xs ys ]
@

>>> scalarproduct [1,2,3] [4,5,6]
32
-}
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [ x * y | (x, y) <- zip xs ys ]

