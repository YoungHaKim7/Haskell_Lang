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
