{- |
Module      : Ch04Ex02
Description : 『プログラミングHaskell第2版』練習問題 4.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リストの三つめの要素を返す関数 @third :: [a] -> a@ を以下を使ってそれぞれ定義してください．
ただし，リストには三つ以上の要素が格納されているとします．

-}
module Ch04Ex02 where

{- |
  リストの三つめの要素 その1

@
third1 :: [a] -> a
third1 = head . tail . tail
@

>>> third1 [1,2,3,4,5,6]
3
-}
third1 :: [a] -> a
third1 = head . tail . tail

{- |
  リストの三つめの要素 その2

@
third2 :: [a] -> a
third2 = (!! 2)
@

>>> third2 [1,2,3,4,5,6]
3
-}
third2 :: [a] -> a
third2 = (!! 2)

{- |
  リストの三つめの要素 その3

@
third3 :: [a] -> a
third3 (_:_:x:_) = x
@

>>> third3 [1,2,3,4,5,6]
3
-}
third3 :: [a] -> a
third3 (_:_:x:_) = x
