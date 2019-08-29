{- |
Module      : Ch07.Ex02
Description : 練習問題 7.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュードでの定義を見ないで以下の高階関数を定義してください．

a. リストの要素のすべてが述語を満たすか検査する関数
@
  all :: (a -> Bool) -> [a] -> Bool
@

b. リストの要素のどれかが述語を満たすか検査する関数
@
  any :: (a -> Bool) -> [a] -> Bool
@

c. リストの先頭から述語を満たす連続した要素を取り出す関数
@
  takeWhile :: (a -> Bool) -> [a] -> [a]
@

d. リストの先頭から述語を満たす連続した要素を取り除く関数
@
  dropWhile :: (a -> Bool) -> [a] -> [a]
@
-}
module Ch07.Ex02 where

import Prelude hiding (all, any, takeWhile, dropWhile)

{- |
  リストの要素のすべてが述語を満たすか検査する関数

@
  all :: (a -> Bool) -> [a] -> Bool
  all p = foldr ((&&) . p) True
@

-}
all :: (a -> Bool) -> [a] -> Bool
all p = foldr ((&&) . p) True

{- |
  リストの要素のどれかが述語を満たすか検査する関数

@
  any p = foldr ((||) . p) False
@
-}
any :: (a -> Bool) -> [a] -> Bool
any p = foldr ((||) . p) False

{- |
  リストの先頭から述語を満たす連続した要素を取り出す関数

@
  takeWhile p = foldr φ []
    where
      φ x xs | p x       = x : xs
              | otherwise = []
@
-}
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p = foldr φ []
  where
    φ x xs | p x       = x : xs
            | otherwise = []
{- |
  リストの先頭から述語を満たす連続した要素を取り除く関数

@
  dropWhile p = para φ []
    where
      φ x (xs, ys)
        | p x       = ys
        | otherwise = x:xs

  para :: (a -> ([a], b) -> b) -> b -> [a] -> b
  para _  z []     = z
  para φ z (x:xs) = φ x (xs, para φ z xs)
@

-}
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p = para φ []
  where
    φ x (xs, ys)
      | p x       = ys
      | otherwise = x:xs

para :: (a -> ([a], b) -> b) -> b -> [a] -> b
para _  z []     = z
para φ z (x:xs) = φ x (xs, para φ z xs) 
