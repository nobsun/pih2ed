{- |
Module      : Ch01.Ex02
Description : 練習問題 1.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

@x@ の値によらず @sum [x] = x@ であることを示してください．
-}
module Ch01.Ex02 where

import Prelude hiding (sum)

{- |
   リストの要素の和

   @
     sum []     = 0           -- (1)
     sum (n:ns) = n + sum ns  -- (2)
   @

   @
     sum [x]
     = { [x] ≡ (x:[]) }
     sum (x:[])
     = { sumの定義(2) }
     x + sum []
     = { sumの定義(1) }
     x + 0
     = { 0 は + の単位元 }
     x
   @
-}
sum []     = 0
sum (n:ns) = n + sum ns
