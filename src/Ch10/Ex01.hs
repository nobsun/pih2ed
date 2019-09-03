{- |
Module      : Ch10.Ex01
Description : 練習問題 10.1
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

リスト内包表記とプレリュード関数 @sequence_ :: [IO a] -> IO ()@ を用いて，@putStr :: String -> IO ()@ を再定義してください．
-}
module Ch10.Ex01 where

import Prelude hiding (putStr)

{- |
  再定義した @putStr@

@
  putStr cs = sequence_ [ putChar c | c <- cs ]
@

>>> putStr "Hello, world!\n"
Hello, world!
-}
putStr :: String -> IO ()
putStr cs = sequence_ [ putChar c | c <- cs ]
