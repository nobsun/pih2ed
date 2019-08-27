{- |
Module      : Ch05.Ex02
Description : 練習問題 5.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

m × n の座標格子が， 0 ≦ x ≦ m ， 0 ≦ y ≦ n に対し，
すべての整数の組 (x, y) で表現されているとします．
リスト内包表記を一つ用いて，与えられた大きさの座標格子を返す関数
@grid :: Int -> Int -> [(Int,Int)]@ を定義してください．
-}
module Ch05.Ex02 where

{- |
  格子点

>>> grid 1 2
[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
-}
grid :: Int -> Int -> [(Int,Int)]
grid m n = [ (x, y) | x <- [ 0 .. m ], y <- [ 0 .. n ] ]
