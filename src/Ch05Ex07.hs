{- |
Module      : Ch05Ex07
Description : 『プログラミングHaskell第2版』練習問題 5.7
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

二つの生成器を持つリスト内包表記 @[(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]@ は，
一つの生成器を持つリスト内包表記二つでも表現できることを示してください．
-}
module Ch05Ex07 where

{- $setup
>>> [ (x, y) | x <- [1, 2, 3], y <- [4, 5, 6] ] == concat [ [(x, y) | y <- [4, 5, 6] ] | x <- [1, 2, 3] ]
True
-}
