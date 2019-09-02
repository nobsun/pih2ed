{- |
Module      : Ch09.Ex01
Description : 練習問題 9.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @add@ と同様に自然数の乗算関数 @mult :: Nat -> Nat -> Nat@ を再帰的に定義してください．
-}
module Ch09.Ex01 where

import Ch09.CountDown hiding (choices)

{- |
  選択肢の生成

@
  choices xs = [ zs | ys <- subs xs, zs <- perms ys ]
@

>>> choices [1,2,3]
[[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
-}
choices :: [a] -> [[a]]
choices xs = [ zs | ys <- subs xs, zs <- perms ys ]
