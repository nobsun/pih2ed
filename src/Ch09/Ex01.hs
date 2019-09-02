{- |
Module      : Ch09.Ex01
Description : 練習問題 9.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数合成 @concat@ および @map@ の代わりにリスト内包表記を使って，組み合わせの関数 @choices@ を再定義してください．
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
