{- |
Module      : Ch09.Ex02
Description : 練習問題 9.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

再帰的な関数 @isChoice :: Eq a => [a] -> [a] -> Bool@ を定義してください．
この関数は @perms@ や @subs@ を使わずに，一方のリストが他方のリストから選択されたものかを検査します．
-}
module Ch09.Ex02 where

{- |
  最初に見つけた特定の要素をリストから取り除く
-}
removeone :: Eq a => a -> [a] -> [a]
removeone _ [] = []
removeone x (y:ys)
  | x == y     = ys
  | otherwise  = y : removeone x ys

{- |
  一方が他方のリストから選択さたものかをチェックする
-}
isChoice :: Eq a => [a] -> [a] -> Bool
isChoice [] _      = True
isChoice (_:_) []  = False
isChoice (x:xs) ys = x `elem` ys && isChoice xs (removeone x ys)
