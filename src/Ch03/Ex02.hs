{- |
Module      : Ch03.Ex02
Description : 練習問題 3.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下の関数の定義を書き下してください．型が正しい限り，どのように実装してもかまいません．

@
bools :: [Bool]
nums :: [[Int]]
add :: Int -> Int -> Int -> Int
copy :: a -> (a, a)
apply :: (a -> b) -> a -> b
@ 

-}
module Ch03.Ex02 where

{- |
>>> :type bools
bools :: [Bool]
-}
bools :: [Bool]
bools = [False, True]

{- |
>>> :type nums
nums :: [[Int]]
-}
nums :: [[Int]]
nums = [[1,2,3],[4,5,6],[7,8,9]]

{- |
>>> :type add
add :: Int -> Int -> Int -> Int
-}
add :: Int -> Int -> Int -> Int
add x y z = sum [x, y, z] :: Int

{- |
>>> :type copy
copy :: a -> (a, a)
-}
copy :: a -> (a, a)
copy x = (x, x)

{- |
>>> :type apply
apply :: (a -> b) -> a -> b
-}
apply :: (a -> b) -> a -> b
apply f x = f x
