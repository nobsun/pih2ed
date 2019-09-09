module Ch11.TicTacToe where

import Data.Char
import Data.List
import System.IO

import Ch10.LifeGame (goto, cls)

-- 11.2 基本的な宣言

{- |
  格子サイズ
-}
size :: Int
size = 3

{- |
  格子
-}
type Grid = [[Player]]

{- |
  プレイヤ
-}
data Player = O | B | X
              deriving (Eq, Ord, Show)

{- |
  次のプレイヤ
-}
next :: Player -> Player
next O = X
next B = B
next X = O

-- 11.3 格子に関する便利な関数

{- |
  空の格子
-}
empty :: Grid
empty = replicate size (replicate size B)

{- |
  充蜜の判定
-}
full :: Grid -> Bool
full = all (/= B) . concat

{- |
  次のターン

>>> turn empty
O
-}
turn :: Grid -> Player
turn g = if os <= xs then O else X
  where
    os = length (filter (== O) ps)
    xs = length (filter (== X) ps)
    ps = concat g

{- |
  勝利判定
-}
wins :: Player -> Grid -> Bool
wins p g = any line (rows ++ cols ++ dias)
  where
    line = all (== p)
    rows = g
    cols = transpose g
    dias = [ diag g, diag (map reverse g) ]

{- |
  対角線上のプレイヤ
-}
diag :: Grid -> [Player]
diag g = [ g !! n !! n | n <- [0 .. size-1] ]

{- |
  勝者の存在判定
-}
won :: Grid -> Bool
won g = wins O g || wins X g

-- 11.4 格子の表示

putGrid :: Grid -> IO ()
putGrid = putStrLn . unlines . concat . interleave bar . map showRow
  where
    bar = [ replicate ((size * 4) - 1) '-' ]

{- |
  行の表示文字列リスト
-}
showRow :: [Player] -> [String]
showRow = beside . interleave bar . map showPlayer
  where
    beside = foldr1 (zipWith (++))
    bar    = replicate 3 "|"

{- |
  プレイヤの値を文字列のリストに変換する
-}
showPlayer :: Player -> [String]
showPlayer O = ["   ", " O ", "   "]
showPlayer B = ["   ", "   ", "   "]
showPlayer X = ["   ", " X ", "   "]

{- |
  リストの要素の間に指定の要素を挟みこむ
-}
interleave :: a -> [a] -> [a]
interleave _ []     = []
interleave _ [y]    = [y]
interleave x (y:ys) = y : x : interleave x ys

-- 11.5 手を決める

{- |
  手の有効性判定
-}
valid :: Grid -> Int -> Bool
valid g i = 0 <= i && i < size ^ 2 && concat g !! i == B

{- |
  指し手
-}
move :: Grid -> Int -> Player -> [Grid]
move g i p = if valid g i then [ chop size (xs ++ [p] ++ ys) ] else []
  where
    (xs, B:ys) = splitAt i (concat g)

{- |
  リストの断片化
-}
chop :: Int -> [a] -> [[a]]
chop n [] = []
chop n xs = take n xs : chop n (drop n xs)

-- 11.6 番号を読み込む

{- |
  プレイヤの指し手を読み込む
-}
getNat :: String -> IO Int
getNat prompt = do
  putStr prompt
  xs <- getLine
  if xs /= [] && all isDigit xs then
     return (read xs)
  else
     do putStrLn "ERROR: Invalid number"
        getNat prompt

-- 11.7 人間対人間

{- |
  三目並べ
-}
tictactoe :: IO ()
tictactoe = run empty O

{- |
  起動
-}
run :: Grid -> Player -> IO ()
run g p = do
  cls
  goto (1,1)
  putGrid g
  run' g p

{- |
  駆動
-}
run' :: Grid -> Player -> IO ()
run' g p
  | wins O g  = putStrLn "Player O wins!\n"
  | wins X g  = putStrLn "Player X wins!\n"
  | full g    = putStrLn "It's a draw!\n"
  | otherwise = do
      i <- getNat (prompt p)
      case move g i p of
        []   -> do
          putStrLn "ERROR: Invalid move"
          run' g p
        [g'] -> run g' (next p)

prompt :: Player -> String
prompt p = "Player " ++ show p ++ ", enter your move: "

-- 11.8 ゲームの木

{- |
  木
-}
data Tree a = Node a [Tree a]
  deriving Show

{- |
  ゲーム木
-}
gametree :: Grid -> Player -> Tree Grid
gametree g p = Node g [ gametree g' (next p) | g' <- moves g p ]

moves :: Grid -> Player -> [Grid]
moves g p
  | won g     = []
  | full g    = []
  | otherwise = concat [ move g i p | i <- [0 .. ((size ^ 2) - 1)] ]

-- 11.9 枝を刈る

{- |
  枝刈り
-}
prune :: Int -> Tree a -> Tree a
prune 0 (Node x _)  = Node x []
prune n (Node x ts) = Node x [ prune (n-1) t | t <- ts ]

{- |
  ゲーム木の深さ上限
-}
depth :: Int
depth = 9

-- 11.10 ミニマックス法

{- |
  minimax木
-}
minimax :: Tree Grid -> Tree (Grid, Player)
minimax (Node g [])
  | wins O g  = Node (g, O) []
  | wins X g  = Node (g, X) []
  | otherwise = Node (g, B) []
minimax (Node g ts)
  | turn g == O = Node (g, minimum ps) ts'
  | turn g == X = Node (g, maximum ps) ts'
                  where
                    ts' = map minimax ts
                    ps = [ p | Node (_, p) _ <- ts' ]

{- |
  最善手の選択
-}
bestmove :: Grid -> Player -> Grid
bestmove g p = head [ g' | Node (g', p') _ <- ts, p' == best ]
  where
    tree = prune depth (gametree g p)
    Node (_, best) ts = minimax tree

-- 11.11 人間対コンピュータ

{- |
  人間対コンピュータ 
-}
main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  play empty O

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
      putStr "Player X is thinking... "
      (play $! bestmove g p) (next p)
