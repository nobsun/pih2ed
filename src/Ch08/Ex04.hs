{-# LANGUAGE StandaloneDeriving #-}
{- |
Module      : Ch08.Ex04
Description : 練習問題 8.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

空でない整数のリストを平衡木に変換する関数 @balance :: [a] -> Tree a@ を定義してください
-}
module Ch08.Ex04 where

import Ch08.Ex03

deriving instance Show a => Show (Tree a)
{- |
  リストを2分割

>>> halve [1,2,3,4,5]
([1,2,3],[4,5])
-}

halve :: [a] -> ([a], [a])
halve xs = iter id xs xs
  where
    iter f ys []     = (f [], ys)
    iter f (y:ys) zs = iter (f . (y :)) ys (drop 2 zs)

{- |
  平衡木の生成

>>> balance [1,2,3,4,5]
Node (Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)) (Node (Leaf 4) (Leaf 5))
>>> balanced (balance [1,2,3,4,5,6,7])
True
-}

balance :: [a] -> Tree a
balance [x] = Leaf x
balance xs  = uncurry Node $ balance *** balance $ halve xs

(***) :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
(f *** g ) (x, y) = (f x, g y)
