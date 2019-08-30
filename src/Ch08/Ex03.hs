{- |
Module      : Ch08.Ex03
Description : 練習問題 8.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下の二分木を考えましょう．

@
  data Tree a = Leaf a | Node (Tree a) (Tree a)
@

すべての節に対して，右と左の部分木にある葉の数が高々一つだけ異なるとき，木は平衡していると呼びます．
葉は平衡していると考えます．二分木が平衡しているか調べる関数 @balanced :: Tree a -> Bool@ を定義してください
-}
module Ch08.Ex03 where

import Data.Bool

{- |
  二分木
-}
data Tree a
  = Leaf a
  | Node (Tree a) (Tree a)

{- |
  葉の数

@
  leaves (Leaf _) = 1
  leaves (Node l r) = leaves l + leaves r
@
-}
leaves :: Tree a -> Int
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r

{- |
  葉の数(平衡でない部分木では0)

@
  leaves' (Leaf _) = 1
  leaves' (Node l r)
    = case leaves' l of
        0 -> 0
        m -> case leaves' r of
          0 -> 0
          n -> bool 0 (m + n) (abs (m - n) <= 1)
@
-}
leaves' (Leaf _) = 1
leaves' (Node l r)
  = case leaves' l of
      0 -> 0
      m -> case leaves' r of
        0 -> 0
        n -> bool 0 (m + n) (abs (m - n) <= 1)

{- |
  平衡判定

@
  balanced = (/= 0) . leaves' 
@
-}
balanced :: Tree a -> Bool
balanced = (/= 0) . leaves' 
