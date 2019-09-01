{- |
Module      : Ch08.Ex09
Description : 練習問題 8.9
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch08.Ex09 where

{- |
  式
-}
data Expr
  = Val Int
  | Add Expr Expr
  | Mul Expr Expr
  deriving (Eq, Show)

{-
  制御スタック
-}
type Cont = [Op]

{- |
  命令
-}
data Op
  = EVAL Expr
  | ADD Int
  | MUL Int

{- |
  評価器
-}
eval :: Expr -> Cont -> Int
eval (Val n) c = exec c n
eval (Add x y) c = eval x (EVAL y : ADD 0 : c)
eval (Mul x y) c = eval x (EVAL y : MUL 1 : c)

{- |
  実行器
-}
exec :: Cont -> Int -> Int
exec []                  n = n
exec (EVAL y : ADD _ : c) n = eval y (ADD n : c)
exec (EVAL y : MUL _ : c) n = eval y (MUL n : c)
exec (ADD m : c)          n = exec c (m+n)
exec (MUL m : c)          n = exec c (m*n)

{- |
  式の値

>>> value (Add (Add (Val 2) (Val 3)) (Val 4))
9
>>> value (Mul (Add (Val 2) (Val 3)) (Val 4))
20
-}

value :: Expr -> Int
value e = eval e []
