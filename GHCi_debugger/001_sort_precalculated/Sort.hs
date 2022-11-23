module Sort (sort) where

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x < y     = x:y:ys
                | otherwise = y:(insert x ys)


-- :break - Set a Breakpoint
-- :abandon - Exit the current debug evaluation
-- :list - Show the source code around the current breakpoint
-- :continue - Run to the next break point
-- HaskellerZ - October 2019 - Roland Senn - The GHCi debugger
-- https://youtu.be/L7QZwH_844s
-- PS D:\young_project\haskell_lang\Haskell_Lang\GHCi_debugger\001_sort_precalculated> ghci .\Sort.hs
-- GHCi, version 9.2.5: https://www.haskell.org/ghc/  :? for help
-- [1 of 1] Compiling Sort             ( Sort.hs, interpreted )
-- Ok, one module loaded.
-- ghci> :break 5
-- Breakpoint 0 activated at Sort.hs:5:15-32
-- ghci> sort "car"
-- "Stopped in Sort.sort, Sort.hs:5:15-32
-- _result :: [Char] = _
-- x :: Char = 'c'
-- xs :: [Char] = _
-- [Sort.hs:5:15-32] ghci> *Sort> :abandon
-- 
-- <interactive>:3:1: error: parse error on input ‘*’
-- [Sort.hs:5:15-32] ghci> *Sort> :abandon
-- 
-- <interactive>:4:1: error: parse error on input ‘*’
-- [Sort.hs:5:15-32] ghci> sort "car"
-- "Stopped in Sort.sort, Sort.hs:5:15-32
-- _result :: [Char] = _
-- x :: Char = 'c'
-- xs :: [Char] = _
-- ... [Sort.hs:5:15-32] ghci> :abandon
-- [Sort.hs:5:15-32] ghci> sort "car"
-- "Stopped in Sort.sort, Sort.hs:5:15-32
-- _result :: [Char] = _
-- x :: Char = 'c'
-- xs :: [Char] = _
-- ... [Sort.hs:5:15-32] ghci> :list
-- 4  sort [] = []
-- 5  sort (x:xs) = insert x (sort xs)
--                  ^^^^^^^^^^^^^^^^^^
-- 6
-- ... [Sort.hs:5:15-32] ghci> :cont
-- Stopped in Sort.sort, Sort.hs:5:15-32
-- _result :: [Char] = _
-- x :: Char = 'a'
-- xs :: [Char] = _
-- ... [Sort.hs:5:15-32] ghci> :cont
-- Stopped in Sort.sort, Sort.hs:5:15-32
-- _result :: [Char] = _
-- x :: Char = 'r'
-- xs :: [Char] = _
-- ... [Sort.hs:5:15-32] ghci> :cont
-- acr"
-- [Sort.hs:5:15-32] ghci> :q
-- Leaving GHCi.
