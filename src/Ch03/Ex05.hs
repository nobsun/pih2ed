{- |
Module      : Ch03.Ex05
Description : 練習問題 3.5
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

一般的に，関数の型を Eq クラスのインスタンスにするのが実現不可能な理由は何でしょうか?
実現可能なのはどういった場合でしょうか?

関数の等値性は，外延的等値性を確認することになるが，
関数の域(domain)を網羅列挙して確認することは一般にはできない．
ただし，域が現実的に網羅列挙可能であれば Eq クラスのインスタンスにできる．
-}
module Ch03.Ex05 where
