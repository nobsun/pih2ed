{- |
Module      : Ch09.Ex05
Description : 練習問題 9.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @choices@，@exprs@，@eval@ を用いて，1，3，7，1，25，50 に対する可能な式は 33,665,406 個あり，そのうち 4,672,540 個のみが有効であることを確
かめてください
-}
module Ch09.Ex05 where

import Ch09.CountDown hiding (eval, valid)

{- $setup

>>> ns = [1,3,7,10,25,50]
-}

{- |
  評価器

>>> length [ e | ns' <- choices ns, e <- exprs ns', _ <- eval e ]
10839369
-}
eval :: Expr -> [Int]
eval (Val n)     = [n]
eval (App o l r) = [ apply o x y | x <- eval l, y <- eval r, valid o x y ]

{- |
  Validator

@
  valid Add x y = True
  valid Sub x y = True
  valid Mul x y = True
  valid Div x y = y /= 0 && x `mod` y == 0
@
-}
valid :: Op -> Int -> Int -> Bool
valid Add x y = True
valid Sub x y = True
valid Mul x y = True
valid Div x y = y /= 0 && x `mod` y == 0
