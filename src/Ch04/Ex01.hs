{- |
Module      : Ch04.Ex01
Description : 練習問題 4.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数を使って，長さが偶数のリストを半分ずつに分割する関数
@halve :: [a] -> ([a], [a])@ を定義してください．

-}
module Ch04.Ex01 where

{- |
  長さ偶数のリストを半分ずつに分割する．

>>> halve [1,2,3,4,5,6]
([1,2,3],[4,5,6])

-}
halve :: [a] -> ([a], [a])
halve = flip splitAt <*> (`div` 2) . length

{- --
-- 反復
halve' :: [a] -> ([a], [a])
halve' xs = iter id xs xs
  where
    iter f ys []     = (f [], ys)
    iter f (y:ys) zs = iter (f . (y :)) ys (drop 2 zs)
-- -}
