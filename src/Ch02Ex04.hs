{- |
Module      : Ch02Ex04
Description : 『プログラミングHaskell第2版』練習問題 2.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数 @last@ は，空でないリストの最後の要素を取り出します．
たとえば，@last [1,2,3,4,5]@ = @5@ です．
この章で紹介したプレリュード関数を使って，関数 @last@ を定義してください．
さらに別の定義も考えてみてください．
-}
module Ch02Ex04 where

{- |
@last@ の定義

@
last' (x:[]) = x
last' (_:xs) = last' xs
@

>>> last' [1,2,3,4,5]
5
-}
last' (x:[]) = x
last' (_:xs) = last' xs

{- |
もう一つの @last@ の定義

@
last'' = head . reverse
@

>>> last'' [1,2,3,4,5]
5
-}
last'' = head . reverse
