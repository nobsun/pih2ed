{- |
Module      : Ch10.Ex03
Description : 練習問題 10.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リスト内包表記と @sequence_@ を使って，@putBoard@ の拡張版を再実装してください．
-}
module Ch10.Ex03 where

import Ch10.Nim hiding (putBoard)

{- |
  ボードの表示

>>> putBoard initial
1: * * * * * 
2: * * * * 
3: * * * 
4: * * 
5: * 
-}
putBoard :: Board -> IO ()
putBoard board = sequence_ [ putRow r n | (r, n) <- zip [1..] board ]
