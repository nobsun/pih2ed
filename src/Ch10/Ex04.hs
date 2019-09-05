{- |
Module      : Ch10.Ex04
Description : 練習問題 10.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

指定した数だけキーボードから数字を読み取り，それらの和を表示する @adder :: IO ()@ を定義してください．
-}
module Ch10.Ex04 where

import Data.Char
{- |
  加算器

> adder
How many numbers? 5
1
3
5
7
9
The total is 25
-}
adder :: IO ()
adder = do
  putStr "How many numbers? "
  s <- getLine
  adder' 0 (read s)

{- |
  補助関数
-}
adder' :: Int -> Int -> IO ()
adder' a 0 = putStrLn (show a)
adder' a n = do
  s <- getLine
  adder' (a + read s) (n - 1)

