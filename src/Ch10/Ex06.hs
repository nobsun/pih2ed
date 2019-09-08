{-# LANGUAGE BangPatterns #-}
{- |
Module      : Ch10.Ex06
Description : 練習問題 10.6
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

getCh を用いて，アクション @readLine :: IO String@ を定義してください．
このアクションは，@getLine@ に似ていますが，文字を消すために消去キーが利用できます．
-}
module Ch10.Ex06 where

import System.IO
import Ch10.Hangman (getCh)

{- |
  消去キーが使える readLine

@
readLine = do
  ibuf <- hGetBuffering stdin
  obuf <- hGetBuffering stdout
  hSetBuffering stdin NoBuffering
  hSetBuffering stdout NoBuffering
  str <- loop ""
  hSetBuffering stdin ibuf
  hSetBuffering stdout obuf
  return str
@
-}
readLine :: IO String
readLine = do
  ibuf <- hGetBuffering stdin
  obuf <- hGetBuffering stdout
  hSetBuffering stdin NoBuffering
  hSetBuffering stdout NoBuffering
  str <- loop ""
  hSetBuffering stdin ibuf
  hSetBuffering stdout obuf
  return str

{- |
  readLine の下請け

@
loop xs = do
  c <- getCh
  case c of
    '\n'   -> do putChar c
                 return (reverse xs)
    '\DEL' -> case xs of
       ""    -> loop xs
       _     -> do putChar '\b'
                   putChar ' '
                   putChar '\b'
                   loop (tail xs)
    _      -> do putChar c
                 loop (c:xs)
@
-}
loop :: String -> IO String
loop xs = do
  c <- getCh
  case c of
    '\n'   -> do putChar c
                 return (reverse xs)
    '\DEL' -> case xs of
       ""    -> loop xs
       _     -> do putChar '\b'
                   putChar ' '
                   putChar '\b'
                   loop (tail xs)
    _      -> do putChar c
                 loop (c:xs)
