{- |
Module      : Ch09.Ex04
Description : 練習問題 9.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @choices@，@exprs@，@eval@ を用いて，1，3，7，1，25，50 に対する可能な式は 33,665,406 個あり，そのうち 4,672,540 個のみが有効であることを確
かめてください
-}
module Ch09.Ex04 where

import Ch09.CountDown

{- $setup

>>> ns = [1,3,7,10,25,50]
>>> length [ e | ns' <- choices ns, e <- exprs ns' ]
33665406
>>> length [ e | ns' <- choices ns, e <- exprs ns', _ <- eval e ]
4672540
-}
