{- |
Module      : Ch03.Ex03
Description : 練習問題 3.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

以下の関数の型は何でしょう?

@
second xs = head (tail xs)
swap (x,y) = (y,x)
pair x y = (x,y)
double x = x*2
palindrome xs = reverse xs == xs
twice f x = f (f x)
@

-}
module Ch03.Ex03 where

{- |
>>> :type second
second :: [a] -> a
-}
second :: [a] -> a
second xs = head (tail xs)

{- |
>>> :type swap
swap :: (a, b) -> (b, a)
-}
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

{- |
>>> :type pair
pair :: a -> b -> (a, b)
-}
pair :: a -> b -> (a, b)
pair x y = (x, y)

{- |
>>> :type double
double :: Num a => a -> a
-}
double :: Num a => a -> a
double x = x*2

{- |
>>> :type palindrome
palindrome :: Eq a => [a] -> Bool
-}
palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

{- |
>>> :type twice
twice :: (a -> a) -> a -> a
-}
twice :: (a -> a) -> a -> a
twice f x = f (f x)
