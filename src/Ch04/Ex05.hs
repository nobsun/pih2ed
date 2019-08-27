{- |
Module      : Ch04.Ex05
Description : 練習問題 4.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

他のプレリュード関数や演算子を使わずに，論理積 @&&@ に対する以下の定義を条件式を用いて形式化してください．

@
True && True = True
_    && _    = False
@

-}
module Ch04.Ex05 where

import Prelude hiding ((&&))

{- |
  連言の条件式を使った定式化

@
(&&) :: Bool -> Bool -> Bool
p && q = if p then if q then True else false else false
@

-}
(&&) :: Bool -> Bool -> Bool
p && q = if p then if q then True else False else False
