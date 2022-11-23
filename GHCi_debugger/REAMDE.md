# HaskellerZ - October 2019 - Roland Senn - The GHCi debugger

https://youtu.be/L7QZwH_844s

<br>

# HaskellerZ - October 2019 - Roland Senn - The GHCi debugger

Sort.hs

```

module Sort (sort) where

sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x < y     = x:y:ys
                | otherwise = y:(insert x ys)


```

<br>

<hr>

```
:break - Set a Breakpoint
:abandon - Exit the current debug evaluation
:list - Show the source code around the current breakpoint
:continue - Run to the next break point


PS D:\young_project\haskell_lang\Haskell_Lang\GHCi_debugger\001_sort_precalculated> ghci .\Sort.hs
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
```

# Looking at values

- WithOUT Evaluation of the Value

```
:print - binds each thunk to a fresh variable
:sprint - simple print (default used when hitting breakpoint)
```

if you want to see more values, you have to evaluate some variables

- WITH Evaluation of the Value
  ATTENTION - evaluation of variables at a breakpoint may change the result of the function when using

  -- exceptions<br>
  -- infinite lists

  <br>

- :force -
- seq \_var()

```
$ stack repl Sort.hs

Warning: Couldn't find a component for file target /Sort.hs. This means that the correct ghc options might not be used.
         Attempting to load the file anyway.
Configuring GHCi with the following packages:
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Sort             ( /Sort.hs, interpreted )
Ok, one module loaded.
Loaded GHCi configuration from /private/var/folders/bf/fk_kzm5n5zbfzkv31qhrglhr0000gn/T/haskell-stack-ghci/c9c6f3a8/ghci-script
ghci> sort "Zurixch"
"Zchirux"
ghci> :b 5
Breakpoint 0 activated at /Sort.hs:5:15-32
ghci> sort "Zurixch"
"Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 'Z'
xs :: [Char] = _
[/Sort.hs:5:15-32] ghci> :print xs
xs = (_t1::[Char])
[/Sort.hs:5:15-32] ghci> :sprint xs
xs = _
[/Sort.hs:5:15-32] ghci> :print _t1
_t1 = (_t2::[Char])
[/Sort.hs:5:15-32] ghci> :force xs
xs = "urixch"
[/Sort.hs:5:15-32] ghci> :force _result
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
*** Ignoring breakpoint [/Sort.hs:5:15-32]
_result = "Zchirux"
[/Sort.hs:5:15-32] ghci> :ab
ghci>

```

<br>

# Execute a Default Command after a Breakpoint is hit

```
:set stop [<breakpoint-no>] <command>
```

If <breakpoint-no> is omiited, the <command> is executed for all breakpoint

```
:set stop :list
```

- Recommendation: <br>
  Put :set stop :list in your .ghci file

ex)

```
$ stack repl Sort.hs

Warning: Couldn't find a component for file target /Sort.hs. This means that the correct ghc options might not be used.
         Attempting to load the file anyway.
Configuring GHCi with the following packages:
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Sort             ( /Sort.hs, interpreted )
Ok, one module loaded.
Loaded GHCi configuration from /c9c6f3a8/ghci-script
ghci> :b 5
Breakpoint 0 activated at /Sort.hs:5:15-32
ghci> sort "auto"
"Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 'a'
xs :: [Char] = _
[/Sort.hs:5:15-32] ghci> :list
4  sort [] = []
5  sort (x:xs) = insert x (sort xs)
6
[/Sort.hs:5:15-32] ghci> :set stop :list
[/Sort.hs:5:15-32] ghci> :cont
Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 'u'
xs :: [Char] = _
4  sort [] = []
5  sort (x:xs) = insert x (sort xs)
6
[/Sort.hs:5:15-32] ghci> :cont
Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 't'
xs :: [Char] = _
4  sort [] = []
5  sort (x:xs) = insert x (sort xs)
6
[/Sort.hs:5:15-32] ghci>
```

<br>

# Syntax for : break commands

```
:break <identifier>
:break <line>
:break <line> <column>
:break <module> <line>
:break <module> <line> <column>
```

<br>

- Demo

```
$ cat Main.hs


import Sort

main :: IO ()
main = putStrLn $ show $ sort [6,2,4,1,9]
```

- Demo2

```
$ stack repl Main.hs


Warning: Couldn't find a component for file target /Main.hs. This means that the correct ghc options might not be used.
         Attempting to load the file anyway.
Configuring GHCi with the following packages:
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Sort             ( Sort.hs, interpreted )
[2 of 2] Compiling Main             ( /Main.hs, interpreted )
Ok, two modules loaded.
Loaded GHCi configuration from /T/haskell-stack-ghci/1c76883d/ghci-script
ghci> :br sort
Breakpoint 0 activated at Sort.hs:4:11-12
Breakpoint 1 activated at Sort.hs:5:15-32
ghci> :break insert
Cannot set breakpoint on ‘insert’: ‘insert’ not in scope
ghci> :break Sort.insert
Breakpoint 2 activated at Sort.hs:8:15-17
Breakpoint 3 activated at Sort.hs:9:19-23
Breakpoint 4 activated at Sort.hs:9:31-36
Breakpoint 5 activated at Sort.hs:10:31-45
ghci> :br nonexisting
Cannot set breakpoint on ‘nonexisting’: ‘nonexisting’ not in scope
ghci> :break 3
No breakpoints found at that location.
ghci> :break 4
Breakpoint 6 activated at /Main.hs:4:8-41
ghci> :break 19
No breakpoints found at that location.
ghci> :break 4 19
Breakpoint 7 activated at /Main.hs:4:19-41
ghci> :break 4 20
Breakpoint 7 was already set at /Main.hs:4:19-41
ghci> :break Sort 8
Breakpoint 2 was already set at Sort.hs:8:15-17
ghci> :q
Leaving GHCi.
```

<hr>

- Syntax for : break commands

<br>
--  Only identifiers in scope can be used. <br>
-- If we miss the exact breakpoint, then the next one to the left is used. <br>
--  Cannot set breakpoint on type specifications <br>

<br>

# Demo

```
$ stack repl Sort.hs

Warning: Couldn't find a component for file target /Sort.hs. This means that the correct ghc options might not be used.
         Attempting to load the file anyway.
Configuring GHCi with the following packages:
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Sort             ( /Sort.hs, interpreted )
Ok, one module loaded.
Loaded GHCi configuration from /T/haskell-stack-ghci/c9c6f3a8/ghci-script
ghci> :b 5
Breakpoint 0 activated at /Sort.hs:5:15-32
ghci> sort [3,2,1]
Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [a] = _
x :: a = _
xs :: [a] = [_,_]
[/Sort.hs:5:15-32] ghci> xs

<interactive>:3:1: error:
    • No instance for (Show a) arising from a use of ‘print’
      Cannot resolve unknown runtime type ‘a’
      Use :print or :force to determine these types
      Relevant bindings include it :: [a] (bound at <interactive>:3:1)
      These potential instances exist:
        instance Show Ordering -- Defined in ‘GHC.Show’
        instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
        instance Show Integer -- Defined in ‘GHC.Show’
        ...plus 23 others
        ...plus 12 instances involving out-of-scope types
        (use -fprint-potential-instances to see them all)
    • In a stmt of an interactive GHCi command: print it
[/Sort.hs:5:15-32] ghci> xs::[Integer]

<interactive>:4:1: error:
    • Couldn't match type ‘a’ with ‘Integer’
      Expected: [Integer]
        Actual: [a]
        ‘a’ is untouchable
          inside the constraints: ()
          bound by the inferred type of it :: [Integer]
          at <interactive>:4:1-13
      ‘a’ is an interactive-debugger skolem
    • In the expression: xs :: [Integer]
      In an equation for ‘it’: it = xs :: [Integer]
[/Sort.hs:5:15-32] ghci> :ab
ghci> sort [3,2,1::Int]
Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Int] = _
x :: Int = 3
xs :: [Int] = [2,1]
[/Sort.hs:5:15-32] ghci> sort "abc"
"Stopped in Sort.sort, /Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 'a'
xs :: [Char] = _
... [/Sort.hs:5:15-32] ghci> xs
"bc"
... [/Sort.hs:5:15-32] ghci> :show context
--> sort [3,2,1::Int]
  Stopped in Sort.sort, /Sort.hs:5:15-32
--> sort "abc"
  Stopped in Sort.sort, /Sort.hs:5:15-32
... [/Sort.hs:5:15-32] ghci> :ab
[/Sort.hs:5:15-32] ghci> :show context
--> sort [3,2,1::Int]
  Stopped in Sort.sort, /Sort.hs:5:15-32
[/Sort.hs:5:15-32] ghci> :ab
ghci>

```

<br>
