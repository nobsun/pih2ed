{- |
Module      : Ch07.Ex10
Description : 練習問題 7.10
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @altMap :: (a -> b) -> (a -> b) -> [a] -> [b]@ を定義してください．
この関数は，引数で指定された二つの関数をリストの要素に交互に適用します．
-}
module Ch07.Ex10 where

import Ch07.Ex09

{- |
  Luhnアルゴリズム

>>> luhn [0,1,2,3,4,5,6,7,8,9]
False
>>> luhn [0,1,2,3,4,5,6,7,8,2]
True
-}
luhn :: [Int] -> Bool
luhn = (== 0) . (`mod` 10) . sum . altMap id f . reverse
  where
    f n = if n' > 9 then n' - 9 else n'
      where
        n' = 2 * n
