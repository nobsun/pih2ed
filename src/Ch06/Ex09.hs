{- |
Module      : Ch06.Ex09
Description : 練習問題 6.9
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

五段階の工程を使って，以下のプレリュード関数を定義してください．

a. 数値のリストに対し要素の和を計算する関数 @sum@

b. リストの先頭から @n@ 個の要素を取り出す関数 @take@

c. 空でないリストの末尾の要素を取り出す関数 @last@
-}
module Ch06.Ex09 where

import Prelude hiding (sum, take, last)

{- |
  数値のリストに対し要素の和を計算する関数

  (1)
  @
    sum :: [Int] -> Int
  @

  (2)
  @
    sum :: [Int] -> Int
    sum []     =
    sum (x:xs) =
  @

  (3)
  @
    sum :: [Int] -> Int
    sum []     = 0
    sum (x:xs) =
  @

  (4)
  @
    sum :: [Int] -> Int
    sum []     = 0
    sum (x:xs) = x + sum xs
  @

  (5)
  @
    sum :: Num a => [a] -> a
    sum []     = 0
    sum (x:xs) = x + sum xs
  @
-}
sum :: Num a => [a] -> a
sum []     = 0
sum (x:xs) = x + sum xs

{- |
  リストの先頭から @n@ 個の要素を取り出す関数

  (1)
  @
    take :: Int -> [a] -> [a]
  @

  (2)
  @
    take :: Int -> [a] -> [a]
    take 0 []     = 
    take 0 (x:xs) = 
    take n []     =
    take n (x:xs) =
  @

  (3)
  @
    take :: Int -> [a] -> [a]
    take 0 []     = []
    take 0 (x:xs) = []
    take n []     =
    take n (x:xs) =
  @

  (4)
  @
    take :: Int -> [a] -> [a]
    take 0 []     = []
    take 0 (x:xs) = []
    take n []     = []
    take n (x:xs) = x : take (n-1) xs
  @

  (5)
  @
    take :: Int -> [a] -> [a]
    take 0 _      = []
    take _ []     = []
    take n (x:xs) = x : take (n-1) xs
  @
-}
take :: Int -> [a] -> [a]
take 0 _      = []
take _ []     = []
take n (x:xs) = x : take (n-1) xs

{- |
  空でないリストの末尾の要素を取り出す関数

  (1)
  @
    last :: [a] -> a
  @

  (2)
  @
    last :: [a] -> a
    last (x:xs) = 
  @

  (3)
  @
    last :: [a] -> a
    last (x:xs) | null xs   = x
                | otherwsie =
  @

  (4)
  @
    last :: [a] -> a
    last (x:xs) | null xs   = x
                | otherwsie = last xs
  @

  (5)
  @
    last :: [a] -> a
    last [x]    = x
    last (x:xs) = last xs
  @
-}
last :: [a] -> a
last [x]    = x
last (_:xs) = last xs
