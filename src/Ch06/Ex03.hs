{- |
Module      : Ch06.Ex03
Description : 練習問題 6.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

二つの非負の整数に対する最大公約数を計算するために，ユークリッドの互除法を実現する関数
@ euclid :: Int -> Int -> Int @ を再帰的に定義してください．
-}
module Ch06.Ex03 where

{- |
  ユークリッド互除法

>>> euclid 6 27
3
-}
euclid :: Int -> Int -> Int
euclid x y
  | x == y    = x
  | x < y     = euclid (y - x) y
  | otherwise = euclid x (x - y)

