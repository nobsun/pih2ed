{- |
Module      : Ch06.Ex07
Description : 練習問題 6.7
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @merge :: Ord a => [a] -> [a] -> [a]@ は，整列されたリストを二つ取り，一つの整列されたリストにして返す関数です．
以下に使用例を示します．

@
  > merge [2,5,6] [1,3,4]
  [1,2,3,4,5,6]
@

関数 @merge@ を再帰を用いて定義してください．ただし，関数 @insert@ や @isort@など，
整列されたリストを処理する関数は利用してはいけません．

-}
module Ch06.Ex07 where

{- |
  整列されたリストを二つ取り，一つの整列されたリストにして返す関数

>>> merge [2,5,6] [1,3,4]
[1,2,3,4,5,6]
-}

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xxs@(x:xs) yys@(y:ys)
  | x > y     = y : merge xxs ys
  | otherwise = x : merge xs yys
