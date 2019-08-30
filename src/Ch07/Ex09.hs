{- |
Module      : Ch07.Ex09
Description : 練習問題 7.9
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @altMap :: (a -> b) -> (a -> b) -> [a] -> [b]@ を定義してください．
この関数は，引数で指定された二つの関数をリストの要素に交互に適用します．
-}
module Ch07.Ex09 where

{- |
  引数で指定された二つの関数をリストの要素に交互に適用

>>> altMap (+10) (+100) [0,1,2,3,4]
[10,101,12,103,14]
-}
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f g = zipWith id (cycle [f, g])
