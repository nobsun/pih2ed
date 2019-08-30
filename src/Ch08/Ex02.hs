{- |
Module      : Ch08.Ex02
Description : 練習問題 8.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@compare@メソッドを用いて，探索木用の関数 @occurs :: Ord a => a -> Tree a -> Bool@ を再定義してください
-}
module Ch08.Ex02 where

{- |
  二分探索木
-}
data Tree a
  = Leaf a
  | Node (Tree a) a (Tree a)

{- |
  出現判定

@
  occurs x (Leaf y) = x == y
  occurs x (Node l y r) = case compare x y of
    LT -> occurs x l
    EQ -> True
    GT -> occurs x r
@

  元の実装は1つのノードで x と y の比較が 2 回になる場合があるが，
  新しい実装では 1 回ですむ．
-}
occurs :: Ord a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node l y r) = case compare x y of
  LT -> occurs x l
  EQ -> True
  GT -> occurs x r
