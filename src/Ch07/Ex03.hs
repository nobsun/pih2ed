{- |
Module      : Ch07.Ex03
Description : 練習問題 7.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch07.Ex03 where

import Prelude hiding (map, filter)

{- |
  @foldr@ を使った @map f@ の定義

@
  map f = foldr ((:) . f) []
@

-}
map :: (a -> b) -> [a] -> [b]
map f = foldr ((:) . f) []

{- |
  @foldr@ を使った @filter p@ の定義

@
  filter p = foldr φ []
    where
      φ x xs
        | p x       = x:xs
        | otherwise = xs
@

-}
filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr φ []
  where
    φ x xs
      | p x       = x:xs
      | otherwise = xs
