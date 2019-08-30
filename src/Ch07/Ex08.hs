{- |
Module      : Ch07.Ex08
Description : 練習問題 7.8
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

通信エラーの生じる通信路を用いて，直前の問題で定義した文字列を通信するプログラムを試してください．
この通信路は最初のビットを落とすものとします．
-}
module Ch07.Ex08 where

import Control.Exception
import System.IO
import Ch07.Ex06 (Bit)
import Ch07.Ex07

{- |
  エラーのない伝送路での実験

@
  experiment0 = putStrLn (recv (transmit (send "吾輩は猫である")))
  transmit = id
@

>>> catch experiment0 (\ e -> hPutStrLn stderr (show (e :: SomeException)))
吾輩は猫である
-}
experiment0 :: IO ()
experiment0 = putStrLn (recv (transmit (send "吾輩は猫である")))

{- |
  最初のビットが落ちる伝送路での実験

@
  experiment1 = putStrLn (recv (transmit' (send "吾輩は猫である")))
  transmit' = tail
@

>>> catch experiment1 (\ e -> const (putStrLn "エラーが起きました") (e :: SomeException))
エラーが起きました
-}
experiment1 :: IO ()
experiment1 = putStrLn (recv (transmit' (send "吾輩は猫である")))

transmit' :: [Bit] -> [Bit]
transmit' = tail
