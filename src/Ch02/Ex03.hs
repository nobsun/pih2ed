{- |
Module      : Ch02.Ex03
Description : 練習問題 2.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下のプログラムにはエラーが三つあります．エラーを修正してGHCiで正しく動くか確かめてください．
-}
module Ch02.Ex03 where

{- |
プログラムの修正

@
N =  a 'div' length xs     -- (1)変数名は小文字アルファベット．(2)関数@div@を中置演算子に変更するには@`@で囲む．
     where
         a = 10
        xs = [1,2,3,4,5]   -- (3)同一レベルのバインディングでは左辺のインデント位置を同じにする．
@

>>> n
2
-}

n =  a `div` length xs
     where
         a = 10
         xs = [1,2,3,4,5]
