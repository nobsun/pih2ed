{- |
Module      : Ch08.Ex06
Description : 練習問題 8.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch08.Ex06 where

import Ch08.Ex05

{- |
  評価器

@
  eval = folde id (+)
@
-}
eval :: Expr -> Int
eval = folde id (+)

{- |
  式のサイズ

@
  size = folde (const 1) (+)
@
-}
size :: Expr -> Int
size = folde (const 1) (+)
