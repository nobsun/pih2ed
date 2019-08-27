{- |
Module      : Ch04.Ex03
Description : 練習問題 4.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

プレリュード関数 tail のように振る舞う safetail :: [a] -> [a] 関数を考えてください．
ただし，@tail@ は空リストを与えるとエラーになりますが，
@safetail@ は空リストをエラーとせず，空リストを返すものとします．

- a. 条件式
- b. ガード付きの等式
- c. パターンマッチ

-}
module Ch04.Ex03 where

{- |
   安全な @tail@ その1

@
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then xs else tail xs
@

>>> safetail1 [1,2,3]
[2,3]
>>> safetail1 []
[]
-}
safetail1 :: [a] -> [a]
safetail1 xs = if null xs then xs else tail xs

{- |
   安全な @tail@ その2

@
safetail2 :: [a] -> [a]
safetail2 xs
  | null xs   = xs
  | otherwise = tail xs
@

>>> safetail2 [1,2,3]
[2,3]
>>> safetail2 []
[]
-}
safetail2 :: [a] -> [a]
safetail2 xs
  | null xs   = xs
  | otherwise = tail xs

{- |
   安全な @tail@ その3

@
safetail3 :: [a] -> [a]
safetail3 []     = []
safetail3 (_:xs) = xs
@

>>> safetail3 [1,2,3]
[2,3]
>>> safetail3 []
[]
-}
safetail3 :: [a] -> [a]
safetail3 []     = []
safetail3 (_:xs) = xs

