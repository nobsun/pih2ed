{- |
Module      : Ch03.Ex01
Description : 練習問題 3.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下の値の型は何でしょう?

@
['a','b','c' ]
('a','b','c')
[(False,'0'),(True,'1')]
([False,True],['0','1'])
[tail, init, reverse]
@
-}
module Ch03.Ex01 where

{- $setup

>>> :type ['a','b','c']
['a','b','c'] :: [Char]

>>> :type ('a','b','c')
('a','b','c') :: (Char, Char, Char)

>>> :type [(False,'0'),(True,'1')]
[(False,'0'),(True,'1')] :: [(Bool, Char)]

>>> :type ([False,True],['0','1'])
([False,True],['0','1']) :: ([Bool], [Char])

>>> :type [tail, init, reverse]
[tail, init, reverse] :: [[a] -> [a]]
-}
