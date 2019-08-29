{- |
Module      : Ch07.Ex04
Description : 練習問題 7.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@foldl@ を用いて，十進表記を整数に変換する関数 @dec2int :: [Int] -> Int@ を定義してください．
-}
module Ch07.Ex04 where

{- |
  十進表記を整数に変換する関数

>>> dec2int [2,3,4,5]
2345
-}
dec2int :: [Int] -> Int
dec2int = foldl ((+) . (10 *)) 0
