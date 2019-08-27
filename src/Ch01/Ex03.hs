{- |
Module      : Ch01.Ex03
Description : 練習問題 1.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

数値のリストに対し積を計算する関数 @product@ を定義し，@product [2,3,4]@ = @24@ であることを示してください．
-}
module Ch01.Ex03 where

import Prelude hiding (product)

{- |
   リストの要素の和

   @
     product []     = 1           -- (1)
     product (n:ns) = n * sum ns  -- (2)
   @

   @
     product [2,3,4]
     = { [2,3,4] = (2:[3,4]) }
     product (2:[3,4])
     = { product の定義(2) }
     2 * product [3,4]
     = { [3,4] = (3:[4]) }
     2 * product (3:[4])
     = { product の定義(2) }
     2 * (3 * product [4])
     = { [4] = (4:[]) }
     2 * (3 * product (4:[]))
     = { product の定義(2) }
     2 * (3 * (4 * product []))
     = { product の定義(1) }
     2 * (3 * (4 * 1))
     = { 4 * 1 = 4 }
     2 * (3 * 4)
     = { 3 * 4 = 12 }
     2 * 12
     = { 2 * 12 = 12 }
     24
   @
-}
product []     = 0
product (n:ns) = n * product ns
