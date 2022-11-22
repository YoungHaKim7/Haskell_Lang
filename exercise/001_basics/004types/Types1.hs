-- https://github.com/MondayMorningHaskell/haskellings
-- https://github.com/MondayMorningHaskell/haskellings/blob/master/exercises/basics/Types1.hs


module Types1 where
import Data.Binary (Word32, Word16, Word8)

expresson1 :: Int
expresson1 = 1

expresson2 :: Float
expresson2 = 4.5

expresson3 :: Int
expresson3 = 500

expresson5 :: Int
expresson5 = -32

expresson6 :: Word16
expresson6 = 240

expresson7 :: Word8
expresson7 = 200

expresson8 :: Double
expresson8 = 3.1439489578

expresson9 :: Word32
expresson9 = 30048834


{-
- There are many different numeric types:
  Word - Unsigned integer (>= 0)
  Int64  - 64 bit signed integer
  Word16 - 16 bit unsigned integer
         NOTE: Can use sizes 8, 16, 32, and 64 for both Int and Word
               Int and Word can be either 32 or 64 bit (system dependent)
  Double - Double precision floating point number
  Integer - *Unbounded* integer type
-}

-- ghci> :l Types1.hs
-- [1 of 1] Compiling Types1           ( Types1.hs, interpreted )
-- Ok, one module loaded.
-- ghci> :t exp
-- exp         exponent    expresson1
-- ghci> :t expresson1
-- expresson1 :: Int
-- ghci> :r
-- [1 of 1] Compiling Types1           ( Types1.hs, interpreted )
-- Ok, one module loaded.
-- ghci> expresson2
-- 4.5
-- ghci> :t expresson2
-- expresson2 :: Float
-- ghci> :r
-- [1 of 1] Compiling Types1           ( Types1.hs, interpreted )
-- Ok, one module loaded.
-- ghci> expresson8
-- 3.1439489578
-- ghci> :t expresson8
-- expresson8 :: Double
-- ghci> :t expresson9
-- expresson9 :: Word32
-- ghci> expresson9
-- 30048834
