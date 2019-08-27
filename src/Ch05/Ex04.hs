{- |
Module      : Ch05.Ex04
Description : 練習問題 5.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

ある要素のみからなるリストを生成するプレリュード関数
@replicate :: Int -> a -> [a]@
を関数 @length@ と同じ要領でリスト内包表記を用いて定義してください.
-}
module Ch05.Ex04 where

import Prelude hiding (replicate)

{- |
  同一要素を指定した個数含むリストの生成

>>> replicate 3 True
[True,True,True]
-}
replicate :: Int -> a -> [a]
replicate n x = [ x | _ <- [1 .. n] ]

