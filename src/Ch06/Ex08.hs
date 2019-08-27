{- |
Module      : Ch06.Ex08
Description : 練習問題 6.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @merge@ を使って，マージソートを実行する関数 @msort :: Ord a => [a] -> [a]@ を定義してください．
マージソートは，引数のリストを二つに分割し，それぞれを整列した後で再び一つに戻すことで整列を実現します．
ただし，空リストと要素が一つのリストはすでに整列されていると考えます．
-}
module Ch06.Ex08 where

import Ch06.Ex07

{- |
 マージソート

>>> msort [3,2,1,4]
[1,2,3,4]
-}
msort :: Ord a => [a] -> [a]
msort []  = []
msort [x] = [x]
msort xs  = case halve xs of
  (ys, zs) -> merge (msort ys) (msort zs)

halve :: [a] -> ([a], [a])
halve xs = iter id xs xs
  where
    iter f ys []     = (f [], ys)
    iter f (y:ys) zs = iter (f . (y :)) ys (drop 2 zs)
