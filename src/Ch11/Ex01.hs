{- |
Module      : Ch11.Ex01
Description : 練習問題 11.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

3 x 3 の三目並べを空の格子から始めると，完全なゲームの木の節の数が 549,946 になることを
関数 @gametree@ を使って確かめましょう．また，木の最大の深さが 9 であることを確認してください．
-}
module Ch11.Ex01 where

import Ch11.TicTacToe hiding (depth)

{- |
  節の数

>>> nodes (gametree empty O)
549946
-}
nodes :: Tree a -> Int
nodes (Node _ ts) = 1 + sum [ nodes t | t <- ts ]

{- |
  木の深さ
>>> depth (gametree empty O)
9
-}
depth :: Tree a -> Int
depth (Node _ []) = 0
depth (Node _ ts) = 1 + maximum [ depth t | t <- ts ]
