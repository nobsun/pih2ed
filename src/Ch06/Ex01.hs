{- |
Module      : Ch06.Ex01
Description : 練習問題 6.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

再帰的に定義された階乗関数は， (-1) のように負の整数を与えられた場合，どのように振る舞うでしょうか?
再帰部にガードを加えることで，負の整数を禁止するように定義を変更してください．
-}
module Ch06.Ex01 where

{- |
  階乗関数

@
fac :: Int -> Int
fac 0 = 1
fac n | n < 0     = error "'fac' must be applied to non-negative number"
      | otherwise = n * fac (n - 1)
@

-}
fac :: Int -> Int
fac 0 = 1
fac n | n < 0     = error "fac: must be applied to non-negative number"
      | otherwise = n * fac (n - 1)
