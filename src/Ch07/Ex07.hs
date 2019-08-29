{- |
Module      : Ch07.Ex07
Description : 練習問題 7.7
Copyright   : (c) Nobuo Yamashita, 2019
License     : BSD-3
Maintainer  : nobsun@gmail.com

パリティービットの概念を用いて，文字列の二進数への変換器が単純な通信エラーを検出できるように改良してください．
具体的には，符号化で生成された 8 ビットの二進数に， 1 の数が奇数なら 1 ，そうでないなら 0 になるパリティービットを付加します．
逆に復号の際は 9 ビットの二進数のパリティービットが正しいかを検査し，正しければパリティービットを捨て，
誤りであればパリティーエラーを報告するようにします。
-}
module Ch07.Ex07 where

import Data.Bool
import Data.Char
import Data.Word
import qualified Codec.Binary.UTF8.String as U
import Ch07.Ex06 hiding (map)

{- |
  型変換 Word8 → Int
-}
byte2int :: Word8 -> Int
byte2int = fromEnum

{- |
  型変換 Int → Word8
-}
int2byte :: Int -> Word8
int2byte = toEnum

{- |
  IntからBit列へ変換
-}
int2bin :: Int -> [Bit]
int2bin = unfold (== 0) (`mod` 2) (`div` 2)

{- |
  Bit列からIntへ変換
-}
bin2int :: [Bit] -> Int
bin2int = foldr φ 0
  where
    φ x y = x + 2 * y

{- |
  指定した幅にBit列を調整
-}
make :: Int -> [Bit] -> [Bit]
make n = take n . (++ repeat 0)

{- |
  文字列をBit列に符号
-}
encode :: String -> [Bit]
encode = concatMap (make 8 . int2bin . byte2int) . U.encode

{- |
  Bit列を文字列に復号
-}
decode :: [Bit] -> String
decode = U.decode . map (int2byte . bin2int) . chop 8

{- |
  指定したビット数のビット列に分解
-}
chop :: Int -> [Bit] -> [[Bit]]
chop n = unfold null (take n) (drop n)

{- |
  文字列をBit列に符号した上で，8bitごとにチェックビット1ビット追加

>>> send "吾輩は猫である"
[1,1,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,1,1,1,1,0,1,0,0,0,0,1,0,1,1,1,1,0,0,1,1,1,1,0,1,0,1,0,0,1,0,1,0,1,1,1,1,0,0,0,1,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,1,0,1,0,1,0,1,1,1,0,0,1,1,1,1,0,0,1,1,0,0,0,1,1,1,1,0,1,0,1,0,1,1,1,1,0,0,0,1,1,1,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,1,0,1,1,1,1,0,0,0,1,1,1,0,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,0,0,1,0,0,0,0,0,1,0,1,1,0,1,0,0,0,1]
-}
send :: String -> [Bit]
send = concatMap addCB . chop 8 . encode

{- |
  @send@が生成したビット列をチェックビットをチェックした上で，文字列に復号

>>> recv (send "吾輩は猫である")
"吾輩は猫である"
-}
recv :: [Bit] -> String
recv = decode . concatMap chkCB . chop 9

{- |
  通信路
-}
transmit :: [Bit] -> [Bit]
transmit = id

{- |
  チェックビット
-}
checkBit :: [Bit] -> Bit
checkBit = (`mod` 2) . sum

{- |
  チェックビットの追加
-}
addCB :: [Bit] -> [Bit]
addCB = (:) . checkBit <*> id

{- |
  チェックビットでビット列を検査
-}
check :: [Bit] -> Bool
check = (==) . head <*> checkBit . tail

{- |
  ビット列のチェック
-}
chkCB :: [Bit] -> [Bit]
chkCB bits = bool (error "Error!") (tail bits) (check bits)
