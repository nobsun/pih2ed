module Ch10.Nim where

import Data.Char

-- 10.7 Nim

--- 10.7.1 ゲーム用の便利な関数
{- |
  次のプレイヤー
-}
next :: Int -> Int
next 1 = 2
next 2 = 1

{- |
  ボード
-}
type Board = [Int]

{- |
  初期ボード
-}
initial :: Board
initial = [5,4,3,2,1]

{- |
  終了判定
-}
finished :: Board -> Bool
finished = all (== 0)

{- |
  有効性判定
-}
valid :: Board -> Int -> Int -> Bool
valid board row num = board !! (row - 1) >= num

{- |
  打ち手
-}
move :: Board -> Int -> Int -> Board
move board row num = [ update r n | (r, n) <- zip [1..] board ]
  where
    update r n = if r == row then n - num else n

--- 10.7.2 IO用の便利な関数

{- |
  行の表示
-}
putRow :: Int -> Int -> IO ()
putRow row num = do
  putStr (show row)
  putStr ": "
  putStrLn (concat (replicate num "* "))

{- |
 ボードの表示
-}
putBoard :: Board -> IO ()
putBoard [a,b,c,d,e] = do
  putRow 1 a
  putRow 2 b
  putRow 3 c
  putRow 4 d
  putRow 5 e

{- |
  数字の取得
-}
getDigit :: String -> IO Int
getDigit prompt = do
  putStr prompt
  x <- getChar
  newline
  if isDigit x then
     return (digitToInt x)
  else
     do putStrLn "ERROR: Invalid digit"
        getDigit prompt

{- |
  改行
-}
newline :: IO ()
newline = putChar '\n'

-- 10.7.3 ニムゲーム

{- |
  ニムプレイ
-}
play :: Board -> Int -> IO ()
play board player = do
  newline
  putBoard board
  if finished board then
     do newline
        putStr "Player "
        putStr (show (next player))
        putStrLn " wins!!"
  else
     do newline
        putStr "Player "
        putStrLn (show player)
        row <- getDigit "Enter a row number: "
        num <- getDigit "Stars to remove : "
        if valid board row num then
           play (move board row num) (next player)
        else
           do newline
              putStrLn "ERROR: Invalide move"
              play board player

{- |
  ニム
-}
nim :: IO ()
nim = play initial 1
