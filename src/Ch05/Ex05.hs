{- |
Module      : Ch05.Ex05
Description : 練習問題 5.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@ x^2 + y^2 = z^2 @ を満たす正の整数をピタゴラス数と呼び，三つ組 @(x, y, z)@ で表します．
ピタゴラス数のリストを生成する関数 @ pyths :: Int -> [(Int, Int, Int)] @をリスト内包表記を使って定義してください．
ただし、ピタゴラス数の要素は与えられた上限以下であるとします．
-}
module Ch05.Ex05 where

{- |
  ピタゴラス数

>>> pyths 10
[(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
-}
pyths :: Int -> [(Int, Int, Int)]
pyths n = [ (x, y, z) | x <- [1..10], y <- [1..10], z <- [1..10], x^2 + y^2 == z^2 ]
