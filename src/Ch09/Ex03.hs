{- |
Module      : Ch09.Ex03
Description : 練習問題 9.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

関数 @split@ を拡張して，組の中に空リストも許すようにすると，関数 @solutions@ の挙動にどのような影響を与えるか説明してください．


@
  exprs :: [Int] -> [Expr]
  exprs []  = []
  exprs [n] = [Val n]
  exprs ns  = [ e | (ls, rs) <- split ns
                  , l        <- exprs ls     -- *
                  , r        <- exprs rs     -- *
                  , e        <- combine l r
             ]
@
expr が停止するためには * のところの再帰で，リストが短くなることが保証されなければならないが，
split で空リストを許すとその対は元のリストと同じリストになるために，再帰でリストが短くならない．
実際 expr は停止しなくなる．
-}
module Ch09.Ex03 where

