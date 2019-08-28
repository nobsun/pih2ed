{- |
Module      : Ch07.Ex01
Description : 練習問題 7.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リスト内包表記 @[f x | x <- xs, p x]@ は，高階関数 @map@ と @filter@ を使ってどう書き直せるでしょうか．


@
  map f (filter p xs)
@

-}
module Ch07.Ex01 where

