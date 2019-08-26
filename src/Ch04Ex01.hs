{- |
Module      : Ch04Ex01
Description : 『プログラミングHaskell第2版』練習問題 4.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数を使って，長さが偶数のリストを半分ずつに分割する関数
@halve :: [a] -> ([a], [a])@ を定義してください．

-}
module Ch04Ex01 where

{- |
  長さ偶数のリストを半分ずつに分割する．

>>> halve [1,2,3,4,5,6]
([1,2,3],[4,5,6])

-}
halve :: [a] -> ([a], [a])
halve = flip splitAt <*> (`div` 2) . length
