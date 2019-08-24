{- |
Module      : Ch03Ex01
Description : 『プログラミングHaskell第2版』練習問題 3.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数 @@ は，空でないリストの最後の要素を取り出します．
たとえば，@last [1,2,3,4,5]@ = @5@ です．
この章で紹介したプレリュード関数を使って，関数 @last@ を定義してください．
さらに別の定義も考えてみてください．
-}
module Ch03Ex01 where

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
