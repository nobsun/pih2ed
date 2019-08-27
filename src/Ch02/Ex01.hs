{- |
Module      : Ch02.Ex01
Description : 練習問題 2.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

この章の例題をGHCiを用いて実行してください
-}
module Ch02.Ex01 where

{- $setup
>>> 2+3*4
14

>>> (2+3)*4
20

>>> sqrt (3^2+4^2)
5.0

>>> head [1,2,3,4,5]
1

>>> tail [1,2,3,4,5]
[2,3,4,5]

>>> [1,2,3,4,5] !! 2
3

>>> take 3 [1,2,3,4,5]
[1,2,3]

>>> drop 3 [1,2,3,4,5]
[4,5]

>>> length [1,2,3,4,5]
5

>>> sum [1,2,3,4,5]
15

>>> product [1,2,3,4,5]
120

>>> [1,2,3] ++ [4,5]
[1,2,3,4,5]

>>> reverse [1,2,3,4,5]
[5,4,3,2,1]

>>> :load src/test.hs

>>> quadruple 10
40

>>> take (double 2) [1,2,3,4,5]
[1,2,3,4]

>>> :set editor emacs

>>> :edit

>>> factorial 10
3628800

>>> average [1,2,3,4,5]
3

-}
