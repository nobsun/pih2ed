{- |
Module      : Ch07.Ex05
Description : 練習問題 7.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュードの定義を見ないで以下の二つの高階関数を定義してください．

a. 「引数に組を取る関数」を「カリー化された関数」へ変換する関数 @curry@
b. 「引数が二つのカリー化された関数」を「引数に組を取る関数」へ変換する関数 @uncurry@
-}
module Ch07.Ex05 where

import Prelude hiding (curry, uncurry)

{- |
  「引数に組を取る関数」を「カリー化された関数」へ変換する関数

@
  curry :: ((a, b) -> c) -> a -> b -> c
  curry f x y = f (x, y)
@
-}
curry :: ((a, b) -> c) -> a -> b -> c
curry f = (f .) . (,)

{- |
  「引数が二つのカリー化された関数」を「引数に組を取る関数」へ変換する関数

@
  uncurry :: (a -> b -> c) -> (a, b) -> c
  uncurry f = f . fst <*> snd
@
-}
uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f = f . fst <*> snd

