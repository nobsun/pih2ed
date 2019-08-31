{- |
Module      : Ch08.Ex08
Description : 練習問題 8.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch08.Ex08 where

-- import Ch07.Ex07 (int2bin)

{- |
  命題
-}
data Prop
  = Const Bool
  | Var Char
  | Not Prop
  | And Prop Prop
  | Or Prop Prop
  | Imply Prop Prop
  | Equiv Prop Prop
  deriving (Eq, Show)

{- |
  命題1

>>> p1
And (Var 'A') (Not (Var 'A'))
-}
p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))

{-|
  命題2

>>> p2
Imply (And (Var 'A') (Var 'B')) (Var 'A')
-}
p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')

{-|
  命題3

>>> p3
Imply (Var 'A') (And (Var 'A') (Var 'B'))
-}
p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))

{- |
  命題4

>>> p4
Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')
-}
p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

{- |
  置換表
-}
type Assoc a b = [(a, b)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k == k']

type Subst = Assoc Char Bool

eval :: Subst -> Prop -> Bool
eval _ (Const b)   = b
eval s (Var x)     = find x s
eval s (Not p)     = not (eval s p)
eval s (And p q)   = eval s p && eval s q
eval s (Or p q)    = eval s p || eval s q
eval s (Imply p q) = eval s p <= eval s q
eval s (Equiv p q) = eval s p == eval s q

{- |
  変数の出現リスト

>>> vars p2 == ['A','B','A']
True
-}
vars :: Prop -> [Char]
vars (Const b)   = []
vars (Var x)     = [x]
vars (Not p)     = vars p
vars (And p q)   = vars p ++ vars q
vars (Or p q)    = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
vars (Equiv p q) = vars p ++ vars q

{- |
  指定した長さの真理値リスト

>>> bools 3
[[False,False,False],[False,False,True],[False,True,False],[False,True,True],[True,False,False],[True,False,True],[True,True,False],[True,True,True]]
-}
bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False :) bss ++ map (True :) bss
  where
    bss = bools (n - 1)

{- |
  置換リスト

>>> substs p2
[[('A',False),('B',False)],[('A',False),('B',True)],[('A',True),('B',False)],[('A',True),('B',True)]]
-}
substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
  where
    vs = rmdups (vars p)

rmdups :: Eq a => [a] -> [a]
rmdups []     = []
rmdups (x:xs) = x : rmdups (filter (/= x) xs)

{- |
  恒真検査器

>>> isTaut p1
False
>>> isTaut p2
True
>>> isTaut p3
False
>>> isTaut p4
True
>>> p5 = Or p1 (Not p1)
>>> isTaut p5
True
>>> p6 = Equiv p1 p3
>>> isTaut p6
False
-}
isTaut :: Prop -> Bool
isTaut p = and [ eval s p | s <- substs p ]

