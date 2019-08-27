{- |
Module      : Ch05.Ex10
Description : 練習問題 5.10
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

シーザー暗号のプログラムを変更して大文字も扱えるようにしてください．

-}
module Ch05.Ex10 where

import Data.Char

{- |
  文字を整数に変換 \'a\' -> 0，\'b\' -> 1，... ，\'A\' -> 26，\'B\' -> 27

>>> let2int 'a'
0
>>> let2int 'B'
27
-}
let2int :: Char -> Int
let2int c = ord c - if isLower c then ord 'a' else ord 'A' - 26

{- |
  整数を文字に変換 0 -> \'a\'，1 -> \'b\'，...，26 -> \'A\'，27 -> \'B\'

>>> int2let 1
'b'
>>> int2let 26
'A'
-}
int2let :: Int -> Char
int2let n = chr (if n < 26 then ord 'a' + n else ord 'A' + n - 26)

{- |
  アルファベット文字シフト

>>> shift 3 'a'
'd'
>>> shift 3 'z'
'c'
>>> shift (-3) 'c'
'z'
>>> shift 3 ' '
' '
>>> shift 3 'A'
'D'
>>> shift 3 'Z'
'C'
>>> shift (-3) 'C'
'Z'
-}

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | isUpper c = int2let ((let2int c + n) `mod` 26 + 26)
          | otherwise = c


{- |
  暗号

>>> encode 3 "Haskell is fun"
"Kdvnhoo lv ixq"
>>> encode (-3) "Kdvnhoo lv ixq"
"Haskell is fun"
-}
encode :: Int -> String -> String
encode n xs = [ shift n x | x <- xs ]
