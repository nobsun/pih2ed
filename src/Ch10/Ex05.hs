{- |
Module      : Ch10.Ex05
Description : 練習問題 10.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com


-}
module Ch10.Ex05 where

import Data.Char
{- |
  加算器（再実装）

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
  n  <- getLine
  ns <- sequence [ getInt | _ <- [1..read n] ]
  putStrLn (show (sum ns))

getInt :: IO Int
getInt = do
  n <- getLine
  return (read n)
