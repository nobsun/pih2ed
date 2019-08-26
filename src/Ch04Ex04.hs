{- |
Module      : Ch04Ex04
Description : 『プログラミングHaskell第2版』練習問題 4.4
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

論理積演算子 && と同様に，パターンマッチを使って論理和演算子 @||@ を四通りの方法で定義してください．
-}
module Ch04Ex04 where

import Prelude hiding ((||))

{- |
  1つめの定義

@
def1 :: Bool -> Bool -> Bool
def1 = (||)
  where
    False || False = False
    False || True  = True
    True  || False = True
    True  || True  = True
@
-}
def1 :: Bool -> Bool -> Bool
def1 = (||)
  where
    False || False = False
    False || True  = True
    True  || False = True
    True  || True  = True

{- |
  2つめの定義

@
def2 :: Bool -> Bool -> Bool
def2 = (||)
  where
    False || False = False
    _     || _     = True
@
-}
def2 :: Bool -> Bool -> Bool
def2 = (||)
  where
    False || False = False
    _     || _     = True

{- |
  3つめの定義

@
def3 :: Bool -> Bool -> Bool
def3 = (||)
  where
    False || b = b
    True  || _ = True
@
-}
def3 :: Bool -> Bool -> Bool
def3 = (||)
  where
    False || b = b
    True  || _ = True

{- |
  4つめの定義

@
def4 :: Bool -> Bool -> Bool
def4 = (||)
  where
    False || b = b
    True  || _ = True
@
-}
def4 :: Bool -> Bool -> Bool
def4 = (||)
  where
    b || c | b         = b
           | otherwise = c

