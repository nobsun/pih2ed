{- |
Module      : Ch10.Ex02
Description : 練習問題 10.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

-}
module Ch10.Ex02 where

import Ch10.Nim hiding (putBoard)
{- |
  任意の大きさのボードの表示

>>> putBoard initial
1: * * * * * 
2: * * * * 
3: * * * 
4: * * 
5: * 
-}
putBoard :: Board -> IO ()
putBoard = putBoard' 1

putBoard' :: Int -> Board -> IO ()
putBoard' _ []     = return ()
putBoard' r (n:ns) = putRow r n >> putBoard' (r+1) ns
