{- |
Module      : Ch06.Ex05
Description : 練習問題 6.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

この章で与えられた再帰的定義を使って，@length [1,2,3]@，@drop 3 [1,2,3,4,5]@，@init [1,2,3]@ を簡約してください．
-}
module Ch06.Ex05 where

import Prelude hiding (length, drop, init)

{- |
  リストの長さ
@
  length :: [a] -> Int
  length []     = 0              -- (1)
  length (_:xs) = 1 + length xs  -- (2)
@

@
    length [1,2,3]
  = { (2) }
    1 + (length [2,3])
  = { (2) }
    1 + (1 + (length [3]))
  = { (2) }
    1 + (1 + (1 + lenght []))
  = { (1) }
    1 + (1 + (1 + 0))
  = { (+) }
    1 + (1 + 1)
  = { (+) }
    1 + 2
  = { (+) }
    3
@

>>> length [1,2,3]
3
-}
length :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs

{- |
  リストの先頭から指定した数の要素を落す

@
  drop :: Int -> [a] -> [a]
  drop 0 xs     = xs            -- (1)
  drop _ []     = []            -- (2)
  drop n (_:xs) = drop (n-1) xs -- (3)
@

@
    drop 3 [1,2,3,4,5]
  = { (3) }
    drop 2 [2,3,4,5]
  = { (3) }
    drop 1 [3,4,5]
  = { (3) }
    drop 0 [4,5]
  = { (1) }
    [4,5]
@

>>> drop 3 [1,2,3,4,5]
[4,5]
-}
drop :: Int -> [a] -> [a]
drop 0 xs     = xs            -- (1)
drop _ []     = []            -- (2)
drop n (_:xs) = drop (n-1) xs -- (3)

{- |
  リストの先頭部分

@
  init :: [a] -> [a]
  init [_]    = []          -- (1)
  init (x:xs) = x : init xs -- (2)
@

@
    init [1,2,3]
  = { (2) }
    1 : init [2,3]
  = { (2) }
    1 : (2 : init [3])
  = { (1) }
    1 : (2 : [])
@

>>> init [1,2,3]
[1,2]
-}
init :: [a] -> [a]
init [_]    = []
init (x:xs) = x : init xs

