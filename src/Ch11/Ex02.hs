{- |
Module      : Ch11.Ex02
Description : 練習問題 11.2
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

最終的なプログラムでは，必ず最善手のリストから初手を選択していました．
@System.Random@ モジュールが提供する関数 @randomRIO :: (Int,Int) -> IO Int@
を用いて，最善手をランダムに選ぶように変更してください．
関数 @randomRIO@ は与えられた範囲の中でランダムな整数を生成します．
-}
module Ch11.Ex02 where

import System.Random
import Ch11.TicTacToe 

{- |
  駆動
-}
bestmove' :: Grid -> Player -> IO Grid
bestmove' g p = do
  let bs  = [ g' | Node (g', p') _ <- ts, p' == best ]
  let len = length bs
  i <- randomRIO (0, len-1)
  return (bs !! i)
  where
    tree = prune depth (gametree g p)
    Node (_, best) ts = minimax tree

