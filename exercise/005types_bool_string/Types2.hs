-- https://github.com/MondayMorningHaskell/haskellings/blob/master/exercises/basics/Types2.hs

module Types2 where

bool1 :: Bool
bool1 = True

char1 :: Char
char1 = 'b'

string1 :: String
string1 = "Foobar"

helloWorld :: String
helloWorld = "HelloWorld"


-- ghci> :l Types2.hs
-- [1 of 1] Compiling Types2           ( Types2.hs, interpreted )
-- Ok, one module loaded.
-- ghci> helloWorld
-- "HelloWorld"
-- ghci> char2

-- <interactive>:3:1: error:
--     • Variable not in scope: char2
--     • Perhaps you meant ‘char1’ (line 9)
-- ghci> :t he
-- head        helloWorld
-- ghci> :t helloWorld
-- helloWorld :: String
-- ghci> string1
-- "Foobar"
-- ghci> :t string1
-- string1 :: String
-- ghci> char1
-- 'b'
-- ghci> :t char

-- <interactive>:1:1: error:
--     • Variable not in scope: char
--     • Perhaps you meant ‘char1’ (line 9)
-- ghci> :t char1
-- char1 :: Char
-- ghci> bool1
-- True
-- ghci> :t bool1
-- bool1 :: Bool
-- ghci> :q
-- Leaving GHCi.
