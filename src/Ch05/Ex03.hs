{- |
Module      : Ch05.Ex03
Description : 『プログラミングHaskell第2版』練習問題 5.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リスト内容表記一つと上記の関数 grid を用いて，大きさ n の正方形座標を
返す関数 square :: Int -> [(Int,Int)] を定義してください．
ただし，(0, 0) から (n, n) の対角の格子は含みません．
-}
module Ch05.Ex03 where

{- |
  対角格子を抜いた正方格子

>>> square 2
[(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]
-}
square :: Int -> [(Int, Int)]
square n = [ (x, y) | (x, y) <- grid n n, x /= y ]

grid :: Int -> Int -> [(Int,Int)]
grid m n = [ (x, y) | x <- [ 0 .. m ], y <- [ 0 .. n ] ]
