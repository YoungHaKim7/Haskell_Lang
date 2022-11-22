-- https://github.com/MondayMorningHaskell/haskellings/blob/master/exercises/basics/Types5.hsmodule Types5 where

module Types5 where

charList :: [Char]
charList = "This is strange"

aString :: String
aString = ['H', 'e', 'l', 'l', 'o']

charList2 :: [Char]
charList2 = "Strange___ 뭐지"

string2 :: String
string2 = ['s', 't', 'a', 'n' ,'g', 'e']


-- ghci> :l Types5.hs
-- [1 of 1] Compiling Types5           ( Types5.hs, interpreted )
-- Ok, one module loaded.
-- ghci> charList
-- "This is strange"
-- ghci> :t charList
-- charList :: [Char]
-- ghci> aString
-- "Hello"
-- ghci> :t aString
-- aString :: String
-- ghci> charList2
-- "Strange___ \47952\51648"
-- ghci> :t charList2
-- charList2 :: [Char]
-- ghci> string2
-- "stange"
-- ghci> :t string2
-- string2 :: String
-- ghci> :q
-- Leaving GHCi.
