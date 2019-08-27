{- |
Module      : Ch01.Ex04
Description : 練習問題 1.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リストを降順に整列するように関数@qsort@の定義を変えるにはどうすればよいでしょうか？
-}
module Ch01.Ex04 where

{- |
降順に整列

@
  qsort []     = []                                    -- (1)
  qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller  -- (2) qsort smaller と qsort larger を交換
    where
      smaller = [a | a <- xs, a <= x]
      larger  = [b | b <- xs, b > x]
@

>>> qsort [3,5,1,4,2]
[5,4,3,2,1]
-}
qsort []     = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
  where
    smaller = [a | a <- xs, a <= x]
    larger  = [b | b <- xs, b > x]

