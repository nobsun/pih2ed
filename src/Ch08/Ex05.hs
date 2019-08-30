{- |
Module      : Ch08.Ex05
Description : 練習問題 8.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch08.Ex05 where

{- |
  式
-}
data Expr
  = Val Int
  | Add Expr Expr
  deriving Show

{- |
  式の畳み込み

@
  folde f g e = case e of
    Val x     -> f x
    Add e1 e2 -> g (folde f g e1) (folde f g e2)
@
-}
folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g e = case e of
  Val x     -> f x
  Add e1 e2 -> g (folde f g e1) (folde f g e2)
