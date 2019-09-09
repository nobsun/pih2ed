{- |
Module      : Ch11.Ex03
Description : 練習問題 11.3
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

最終的なプログラムでは，必ず最善手のリストから初手を選択していました．
@System.Random@ モジュールが提供する関数 @randomRIO :: (Int,Int) -> IO Int@
を用いて，最善手をランダムに選ぶように変更してください．
関数 @randomRIO@ は与えられた範囲の中でランダムな整数を生成します．
-}
module Ch11.Ex03 where

import Data.List
import Data.Ord
import System.IO
import System.Random hiding (next)
import Ch10.LifeGame
import Ch11.TicTacToe hiding (bestmove, play, play', main)

{- |
  最善手
-}
bestmove :: Grid -> Player -> Grid
bestmove g p = minimumBy (comparing (treedepth . flip gametree p)) [g' | Node (g',p') _ <- ts, p' == best]
  where
    tree = prune depth (gametree g p)
    Node (_,best) ts = minimax tree

{- |
  木の深さ
-}
treedepth :: Tree a -> Int
treedepth (Node _ []) = 0
treedepth (Node _ ts) = 1 + maximum [ treedepth t | t <- ts ]

{- |
  起動
-}
play :: Grid -> Player -> IO ()
play g p = do
  cls
  goto (1,1)
  putGrid g
  play' g p

{- |
  駆動
-}
play' :: Grid -> Player -> IO ()
play' g p
  | wins O g = putStrLn "Player O wins!\n"
  | wins X g = putStrLn "Player X wins!\n"
  | full g   = putStrLn "It's a draw!\n"
  | p == O   = do
      i <- getNat (prompt p)
      case move g i p of
        []   -> do
          putStrLn "ERROR: Invalid move"
          play' g p
        [g'] -> play g' (next p)
  | p == X   = do
      putStr "Player X is Thinking... "
      (play $! bestmove g p) (next p)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  play empty O
