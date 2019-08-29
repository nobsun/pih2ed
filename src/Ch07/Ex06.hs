{- |
Module      : Ch07.Ex06
Description : 練習問題 7.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @unfold :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> [b]@
を用いて関数 @chop8@，@map f@，@iterate f@ を再定義してください．
-}
module Ch07.Ex06 where

import Prelude hiding (map, iterate)

{- |
  リスト上の unfold

>>> unfold (== 0) (`mod` 2) (`div` 2) 13
[1,0,1,1]
-}
unfold :: (a -> Bool) -> (a -> b) -> (a -> a) -> a -> [b]
unfold p h t x
  | p x       = []
  | otherwise = h x : unfold p h t (t x)


type Bit = Int

{- |
  ビットリストを8ビットの二進表記に分割する

@
  chop8 = unfold null (take 8) (drop 8)
@
-}
chop8 :: [Bit] -> [[Bit]]
chop8 = unfold null (take 8) (drop 8)

{- |
  @unfold@を用いた@map f@の定義

@
  map f = unfold null (f . head) tail
@
-}
map :: (a -> b) -> [a] -> [b]
map f = unfold null (f . head) tail

{- |
  @unfold@を用いた@iterate f@の定義

@
  iterate f = unfold (const False) id f
@
-}
iterate :: (a -> a) -> a -> [a]
iterate f = unfold (const False) id f
