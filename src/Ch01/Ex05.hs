{- |
Module      : Ch01.Ex05
Description : 練習問題 1.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@qsort@の定義で，@<=@ を @<@ に置き換えるとどのような影響があるでしょうか？
-}
module Ch01.Ex05 where

{- |

@
  qsort []     = []                                    -- (1)
  qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger  -- (2)
    where
      smaller = [a | a <- xs, a < x] -- @<=@ を @<@ に置き換える
      larger  = [b | b <- xs, b > x]
@

@qsort@の定義で，@<=@ を @<@ に置き換えると，ピボットとと同値のピボット以外の要素を落してしまうことになる．

>>> qsort [2,2,3,1,1]
[1,2,3]
-}
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a < x]
    larger  = [b | b <- xs, b > x]

