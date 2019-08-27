{- |
Module      : Ch06.Ex02
Description : 練習問題 6.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

与えられた非負の整数から @0@ までを足し合わせる関数 @sumdown :: Int -> Int @ を再帰的に定義してください．
たとえば，@sumdown 3@ は @3+2+1+0@ の結果 @6@ を返します．
-}
module Ch06.Ex02 where

{- |
  与えられた非負の整数から @0@ までを足し合わせる．

>>> sumdown 3
6
-}
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n | n > 0     = n + sumdown (n - 1)
          | otherwise = error "sumdown: must not be applied to negative number"
