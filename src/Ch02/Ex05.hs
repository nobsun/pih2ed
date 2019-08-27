{- |
Module      : Ch02.Ex05
Description : 練習問題 2.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数 @init@ は，空でないリストから最後の要素を取り除きます．
たとえば，@init [1,2,3,4,5]@ = @[1,2,3,4]@ です．関数 @init@ の定義を二通り示してください．
-}
module Ch02.Ex05 where

{- |
@init@ の一つめの定義

@
init' (x:[]) = []
init' (x:xs) = x : init' xs
@

>>> init' [1,2,3,4,5]
[1,2,3,4]
-}
init' (x:[]) = []
init' (x:xs) = x : init' xs

{- |
@init@ のもう一つの定義

@
init'' = reverse . tail . reverse
@

>>> init'' [1,2,3,4,5]
[1,2,3,4]
-}
init'' = reverse . tail . reverse
