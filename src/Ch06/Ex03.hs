{- |
Module      : Ch06.Ex03
Description : 練習問題 6.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

乗算演算子 @*@ の再帰を参考にして，負でない整数に対する冪乗演算子 @^@ を定義
してください．また，その定義を使って @2 ^ 3@ を簡約してください．
-}
module Ch06.Ex03 where

import Prelude hiding ((^))

{- |
  べき乗演算子

@
  m ^ 0 = 1                  -- (1)
  m ^ n = m * (m ^ (n - 1))  -- (2)
@

@
    2 ^ 3
  = { (2) }
    2 * (2 ^ 2)
  = { (2) }
    2 * (2 * (2 ^ 1))
  = { (2) }
    2 * (2 * (2 * (2 ^ 0)))
  = { (1) }
    2 * (2 * (2 * 1))
  = { (*) }
    2 * (2 * 2)
  = { (*) }
    2 * 4
  = { (*) }
    8
@

>>> 2 ^ 3
8
-}

(^) :: Int -> Int -> Int
m ^ 0 = 1
m ^ n = m * (m ^ (n - 1))

infixr 8 ^

