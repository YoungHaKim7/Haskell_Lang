module Types4 where
import Data.Binary (Word16)

list1 :: [Int]
list1 = [1,2,3,4]

emptyList :: [Float]
emptyList = []

boolList :: [Bool]
boolList = [True]

ints :: [Int]
ints = [23234]

floatingVals :: [Float]
floatingVals = [2.3, 3.5, 8.5, 10.1, 13.3, -42.1]

characters :: [Char]
characters = ['e']

unsignedInts :: [Word16]
unsignedInts = [65535]

-- error code
-- mixedList :: [Int, Int, Int, Float]
-- mixedList = [2, 3, 5, 6.7]

-- https://stackoverflow.com/questions/41595322/haskell-mix-two-lists
mix :: [a] -> [a] -> [a]
mix (x:xs) (y:ys) = x : y : mix xs ys
mix x [] = x
mix [] y = y

x = [1, 2.4, 3]
y = ["a", "good haskell", "string"]


-- ghci> :l Types4.hs
-- [1 of 1] Compiling Types4           ( Types4.hs, interpreted )
-- Ok, one module loaded.
-- ghci> list1
-- [1,2,3,4]
-- ghci> :t list1
-- list1 :: [Int]
-- ghci> emptyList
-- []
-- ghci> :t emptyList
-- emptyList :: [Float]
-- ghci> boolList
-- [True]
-- ghci> :t boolList
-- boolList :: [Bool]
-- ghci> ints
-- [23234]
-- ghci> :t in
-- init      interact  ints
-- ghci> :t ints
-- ints :: [Int]
-- ghci> floatingVals
-- [2.3,3.5,8.5,10.1,13.3,-42.1]
-- ghci> :t flo
-- floatDigits   floatRange    floor
-- floatRadix    floatingVals
-- ghci> :t flotingVals

-- <interactive>:1:1: error:
--     • Variable not in scope: flotingVals
--     • Perhaps you meant ‘floatingVals’ (line 17)
-- ghci> :t floatingVals
-- floatingVals :: [Float]
-- ghci> characters
-- "e"
-- ghci> :t characters
-- characters :: [Char]
-- ghci> unsignedInts
-- [65535]
-- ghci> :t unsignedInts
-- unsignedInts :: [Word16]
-- ghci> x
-- [1.0,2.4,3.0]
-- ghci> :t x
-- x :: [Double]
-- ghci> y
-- ["a","good haskell","string"]
-- ghci> :t y
-- y :: [String]
-- ghci> :q
-- Leaving GHCi.
