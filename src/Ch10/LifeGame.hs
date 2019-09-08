module Ch10.LifeGame where

import Control.Concurrent

-- 10.8 ライフ
--- 10.8.1 画面用の便利なアクション

{- |
  画面クリア
-}
cls :: IO ()
cls = putStr "\ESC[2J"

{- |
  文字の位置
-}
type Pos = (Int, Int)

{- |
  位置指定書き込み
-}
writeat :: Pos -> String -> IO ()
writeat p xs = do
  goto p
  putStr xs

goto :: Pos -> IO ()
goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

-- 10.8.2 ライフゲーム

{- |
  ボードの幅
-}
width :: Int
width = 100

{- |
  ボードの高さ
-}
height :: Int
height = 30

{- |
  ボード
-}
type Board = [Pos]

{- |
  グライダ
-}
glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

{- |
  ボードの表示
-}
showcells :: Board -> IO ()
showcells b = sequence_ [ writeat p "0" | p <- b ]

{- |
  生きているセルか
-}
isAlive :: Board -> Pos -> Bool
isAlive b p = elem p b

{- |
  空のセルか
-}
isEmpty :: Board -> Pos -> Bool
isEmpty b p = not (isAlive b p)

{- |
  近傍
-}
neighbs :: Pos -> [Pos]
neighbs (x,y) = map wrap [ (x-1, y-1), (x, y-1)
                         , (x+1, y-1), (x-1, y)
                         , (x+1, y), (x-1, y+1)
                         , (x, y+1), (x+1, y+1)
                         ]

{- |
  ボードの端を連結（トーラスに）する
-}
wrap :: Pos -> Pos
wrap (x,y) = ((x - 1) `mod` width + 1
             ,(y - 1) `mod` height + 1)

{- |
  生きた近傍セルの数
-}
liveneighbs :: Board -> Pos -> Int
liveneighbs b = length . filter (isAlive b) . neighbs

{- |
  次世代に生き残るセル
-}
survivors :: Board -> [Pos]
survivors b = [ p | p <- b, elem (liveneighbs b p) [2, 3] ]

{- |
  新たに誕生するセル
-}
births :: Board -> [Pos]
births b = [ p | p <- rmdups (concat (map neighbs b))
               , isEmpty b p
               , liveneighbs b p == 3
               ]
{-
births :: Board -> [Pos]
births b = [ (x, y) | x <- [1 .. width]
                    , y <- [1 .. height]
                    , isEmpty b (x, y)
                    , liveneighbs b (x,y) == 3
                    ]
-}

{- |
  重複の除去
-}
rmdups :: Eq a => [a] -> [a]
rmdups []     = []
rmdups (x:xs) = x : rmdups (filter (/= x) xs)

{- |
  次の世代
-}
nextgen :: Board -> Board
nextgen b = survivors b ++ births b

{- |
  ライフゲームの駆動
-}
life :: Board -> IO ()
life b = do
  cls
  showcells b
  wait 50000
  life (nextgen b)

{- |
  待機
-}
wait :: Int -> IO ()
wait n = sequence_ [ return () | _ <- gen ] -- busy wait
  where
    gen = [1 .. n]


