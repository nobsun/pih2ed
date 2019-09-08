module Main where

import Ch10.Ex06 (readLine)

main :: IO ()
main = do
  { cs <- readLine
  ; putStrLn ("We read : " ++ cs)
  }
