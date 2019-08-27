{- |
Module      : Ch06.Ex06
Description : 練習問題 6.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュードを見ないで，リストに対する以下のプレリュード関数を再帰を使って定義してください．

a. リストの要素がすべて True であるか検査する関数 @and :: [Bool] -> Bool@

b. リストのリストを取り，要素であるリストを連結する関数 @concat :: [[a]] -> [a]@

c. 指定された要素を n 個持つリストを生成する関数 @replicate :: Int -> a -> [a]@

d. 空でないリストの n 番めの要素を取り出す関数 @(!!) :: [a] -> Int -> a@

e. リストの要素に含まれるか検査する関数 @elem :: Eq a => a -> [a] -> Bool@

-}
module Ch06.Ex06 where

import Prelude hiding (and, concat, replicate, (!!), elem)

{- |
  リストの要素がすべて True であるか検査する関数
-}
and :: [Bool] -> Bool
and []     = True
and (b:bs) = b && and bs

{- |
  リストのリストを取り，要素であるリストを連結する関数
-}
concat :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

{- |
  指定された要素を n 個持つリストを生成する関数
-}
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n x = x : replicate (n-1) x

{- |
  空でないリストの n 番めの要素を取り出す関数
-}
(!!) :: [a] -> Int -> a
[]     !! _ = error "index out of range"
(x:_)  !! 0 = x
(_:xs) !! n = xs !! (n-1)

{- |
  リストの要素に含まれるか検査する関数
-}
elem :: Eq a => a -> [a] -> Bool
elem _ []     = False
elem x (y:ys) = x == y || elem x ys

