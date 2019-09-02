module Ch09.CountDown where

-- 9.2 算術演算子

{- |
  算術演算子
-}
data Op
  = Add
  | Sub
  | Mul
  | Div

instance Show Op where
  show Add = "+"
  show Sub = "-"
  show Mul = "*"
  show Div = "/"

{- |
  適正な算術演算か
-}
valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

{- |
  適正な算術演算の適用
-}
apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

-- 9.3 数式

{- |
  数式
-}
data Expr
  = Val Int
  | App Op Expr Expr

{- |
  プリティプリンタ

>>> show (App Add (Val 1) (App Mul (Val 2) (Val 3)))
"1+(2*3)"
-}
instance Show Expr where
  show (Val n) = show n
  show (App o l r) = brak l ++ show o ++ brak r
    where
      brak (Val n) = show n
      brak e       = "(" ++ show e ++ ")"

{- |
  式に含まれる数値のリスト
-}
values :: Expr -> [Int]
values (Val n)     = [n]
values (App _ l r) = values l ++ values r

{- |
  評価器

>>> eval (App Add (Val 2) (Val 3))
[5]
>>> eval (App Sub (Val 2) (Val 3))
[]
-}
eval :: Expr -> [Int]
eval (Val n)     = [n]
eval (App o l r) = [ apply o x y | x <- eval l, y <- eval r, valid o x y ]

-- 組合せ論的関数

{- |
  部分リスト

>>> subs [1,2,3]
[[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
-}
subs :: [a] -> [[a]]
subs []     = [[]]
subs (x:xs) = yss ++ map (x:) yss
  where
    yss = subs xs

{- |
  要素の挿入

>>> interleave 1 [2,3,4]
[[1,2,3,4],[2,1,3,4],[2,3,1,4],[2,3,4,1]]
-}
interleave :: a -> [a] -> [[a]]
interleave x []     = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)

{- |
  要素の順列

>>> perms [1,2,3]
[[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
-}
perms :: [a] -> [[a]]
perms []     = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))

{- |
  選択肢の生成

>>> choices [1,2,3]
[[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
-}
choices :: [a] -> [[a]]
choices = concat . map perms . subs

-- 9.5 問題の形式化

{- |
  解判定

>>> e = App Mul (App Add (Val 1) (Val 50)) (App Sub (Val 25) (Val 10))
>>> e
(1+50)*(25-10)
>>> solution e [1,3,7,10,25,50] 765
True
-}
solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choices ns) && eval e == [n]

-- 9.6 総当たり法

{- |
  空でないリストの空でない分割

>>> split [1,2,3,4]
[([1],[2,3,4]),([1,2],[3,4]),([1,2,3],[4])]
-}
split :: [a] -> [([a],[a])]
split []     = []
split [_]    = []
split (x:xs) = ([x], xs) : [ (x:ls, rs) | (ls, rs) <- split xs ]

{- |
  与えられた数が一回だけ使われている式の生成

-}
exprs :: [Int] -> [Expr]
exprs []  = []
exprs [n] = [Val n]
exprs ns  = [ e | (ls, rs) <- split ns
                , l        <- exprs ls
                , r        <- exprs rs
                , e        <- combine l r
                ]

{- |
  演算子による組み合わせ
-}
combine :: Expr -> Expr -> [Expr]
combine l r = [ App o l r | o <- ops ]

{- |
  算術演算子のリスト
-}
ops :: [Op]
ops = [Add, Sub, Mul, Div]

{- |
  解となる式の選択

>>> length (solutions [1,3,7,10,25,50] 765)
780
-}
solutions :: [Int] -> Int -> [Expr]
solutions ns n = [ e | ns' <- choices ns, e <- exprs ns', eval e == [n] ]

-- 9.8 生成と評価の方法を変える

{- |
  結果の型
-}
type Result = (Expr, Int)

{- |
  与えられた数がそれぞれ一回だけ使われていうる式をすべて返す関数
-}
results :: [Int] -> [Result]
results []  = []
results [n] = [ (Val n, n) | n > 0 ]
results ns  = [ res | (ls, rs) <- split ns
                    , lx       <- results ls
                    , ry       <- results rs
                    , res      <- combine' lx ry ]
{- |
  結果の組み合わせ
-}
combine' :: Result -> Result -> [Result]
combine' (l, x) (r, y) = [ (App o l r, apply o x y) | o <- ops, valid o x y ]

{- |
  解の選択
-}
solutions' :: [Int] -> Int -> [Expr]
solutions' ns n = [ e | ns' <- choices ns, (e, m) <- results ns', m == n ]

{- |
  新しい valid
-}
valid' Add x y = x <= y
valid' Sub x y = x > y
valid' Mul x y = x /= 1 && y /= 1 && x <= y
valid' Div x y = y /= 1 && x `mod` y == 0

{- |
  新しい valid を使った combine
-}
combine'' :: Result -> Result -> [Result]
combine'' (l, x) (r, y) = [ (App o l r, apply o x y) | o <- ops, valid' o x y ]

{- |
  新しい combine を使った results
-}
results' :: [Int] -> [Result]
results' []  = []
results' [n] = [ (Val n, n) | n > 0 ]
results' ns  = [ res | (ls, rs) <- split ns
                     , lx       <- results' ls
                     , ry       <- results' rs
                     , res      <- combine'' lx ry ]

{- |
  速い solutions
-}
solutions'' :: [Int] -> Int -> [Expr]
solutions'' ns n = [ e | ns' <- choices ns, (e, m) <- results' ns', m == n ]

