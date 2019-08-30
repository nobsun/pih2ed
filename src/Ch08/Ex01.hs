{- |
Module      : Ch08.Ex01
Description : 練習問題 8.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @add@ と同様に自然数の乗算関数 @mult :: Nat -> Nat -> Nat@ を再帰的に定義してください．
-}
module Ch08.Ex01 where

data Nat
  = Zero
  | Succ Nat

add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)

{- |
  Nat 上の乗算

@
mult Zero n     = Zero
mult (Succ m) n = add n (mult m n)
@
-}
mult :: Nat -> Nat -> Nat
mult Zero n     = Zero
mult (Succ m) n = add n (mult m n)
