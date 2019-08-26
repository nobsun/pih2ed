{- |
Module      : Ch04Ex08
Description : 『プログラミングHaskell第2版』練習問題 4.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

Luhn アルゴリズム

- それぞれの桁を独立した数だとみなす
- 右から数えて偶数番めの数すべてを二倍にする
- それぞれの数が 9 より大きいなら 9 を引く
- すべての数を足し合わせる
- 合計が 10 で割り切れるなら、カードの番号は正しい

-}
module Ch04Ex08 where

{- |
  数を 2 倍にして、もしその結果が 9 より大きいなら 9 を引く関数

>>> luhnDouble 3
6
>>> luhnDouble 6
3

-}
luhnDouble :: Int -> Int
luhnDouble n = if n' > 9 then n' - 9 else n'
  where
    n' = 2 * n

{- |
  4桁の銀行カード番号が正しいかどうかを判定する関数

>>> luhn 1 7 8 4
True
>>> luhn 4 7 8 3
False
-}
luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
