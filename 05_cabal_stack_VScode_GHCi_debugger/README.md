# VSCode로 하스켈 디버깅 하기

- cabal 은 디버깅 성공

```
// Cabal

// Install ghci-dap, haskell-debug-adapter.

$ cabal update
$
$ cabal install ghci-dap haskell-debug-adapter
$
$ haskell-debug-adapter --version
VERSION: haskell-debug-adapter-0.0.XX.0
$

// Cabal project

$ mkdir project_cabal
$ cd project_cabal
$
$ cabal init
$ cabal configure
$ cabal bulid
$

```
출처 : https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode


- 이거 쓰면 된다.
  - https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode
    - 하스켈 공식 패키지 채널 https://hackage.haskell.org/package/phoityne-vscode

https://stackoverflow.com/questions/49959032/debugging-haskell-in-vs-code

- VSCode하스켈 세팅
  - https://stackoverflow.com/questions/74759150/haskell-extension-for-vscode-not-working-on-linux

- Debugging gi-gtk with VsCode on Windows
  - https://discourse.haskell.org/t/debugging-gi-gtk-with-vscode-on-windows/7514


# cabal 디버깅 성공 ( 단서 )

https://github.com/phoityne/hdx4vsc/issues/32

https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode&ssr=false

https://github.com/phoityne/hdx4vsc


- launch.json

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "ghc",
            "request": "launch",
            "name": "haskell(stack)",
            "internalConsoleOptions": "openOnSessionStart",
            "workspace": "${workspaceFolder}",
            "startup": "${workspaceFolder}/test/Spec.hs",
            "startupFunc": "",
            "startupArgs": "",
            "stopOnEntry": false,
            "mainArgs": "",
            "ghciPrompt": "H>>= ",
            "ghciInitialPrompt": "> ",
            "ghciCmd": "stack ghci --with-ghc=ghci-dap --test --no-load --no-build --main-is TARGET",
            "ghciEnv": {},
            "logFile": "${workspaceFolder}/.vscode/phoityne.log",
            "logLevel": "WARNING",
            "forceInspect": false
        },
        {
            "type": "ghc",
            "request": "launch",
            "name": "haskell(cabal)",
            "internalConsoleOptions": "openOnSessionStart",
            "workspace": "${workspaceFolder}",
            "startup": "${workspaceFolder}/app/Main.hs",
            "startupFunc": "",
            "startupArgs": "",
            "stopOnEntry": false,
            "mainArgs": "",
            "ghciPrompt": "H>>= ",
            "ghciInitialPrompt": "> ",
            "ghciCmd": "cabal repl -w ghci-dap --builddir=${workspaceFolder}/.vscode/dist-cabal-repl",
            "ghciEnv": {},
            "logFile": "${workspaceFolder}/.vscode/phoityne.log",
            "logLevel": "WARNING",
            "forceInspect": false
        }
    ]
}

```


- tasks.json

```json
{
  // Automatically created by phoityne-vscode extension.

  "version": "2.0.0",
  "presentation": {
    "reveal": "always",
    "panel": "new"
  },
  "tasks": [
    {
      // F7
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "label": "haskell build",
      "type": "shell",
      //"command": "cabal configure && cabal build"
      "command": "stack build"
    },
    {
      // F6
      "group": "build",
      "type": "shell",
      "label": "haskell clean & build",
      //"command": "cabal clean && cabal configure && cabal build"
      "command": "stack clean && stack build"
      //"command": "stack clean ; stack build"  // for powershell
    },
    {
      // F8
      "group": {
        "kind": "test",
        "isDefault": true
      },
      "type": "shell",
      "label": "haskell test",
      //"command": "cabal test"
      "command": "stack test"
    },
    {
      // F6
      "isBackground": true,
      "type": "shell",
      "label": "haskell watch",
      "command": "stack build --test --no-run-tests --file-watch"
    }
  ]
}
```


<hr>

# 일반적인 Debugging 프로그램 이건 만든거 같은데Front-end of a Debugger for Compiled Programs in Haskell

https://youtu.be/5H1SAfIdJfw?si=SgMEol9WCr4RgX_X

- Debugging space leaks in haskell-ide-engine
  - https://youtu.be/PL8Wjdt0cKo?si=1Aa1S9Hmzbwiv6Ym

<hr>

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

# GHCi_debugger 안에서도 !이걸 써서 터미널 명령어가 가능하다. ㅎ

- Windows OS 일 경우 type으로 파일 안에 코드를 볼 수 있으니
```
ghci>!:type Main.hs

```

- macOS 일 경우는 cat 또는 bat으로 가능하니깐

```
ghci>!:cat Main.hs

```

<br>

```
001_sort_precalculated> ghci .\Main.hs

GHCi, version 9.2.5: https://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Sort             ( Sort.hs, interpreted )
[2 of 2] Compiling Main             ( Main.hs, interpreted )
Ok, two modules loaded.
ghci> :b Sort 4
Breakpoint 0 activated at Sort.hs:4:11-12
ghci> !:cat Main.hs

<interactive>:2:1: error: parse error on input ‘!:’
ghci> !:type Main.hs

<interactive>:3:1: error: parse error on input ‘!:’
ghci> :!cat Main.hs
'cat'은(는) 내부 또는 외부 명령, 실행할 수 있는 프로그램, 또는
배치 파일이 아닙니다.
ghci> :!type Main.hs
import Sort

main :: IO ()
main = putStrLn $ show $ sort [6,2,4,1,9]
ghci>
```

# Help - My breakpoints don't work

- Beware of CAFs

-- main = putStrLn $ show $ sort [6, 2, 4, 1, 9] is a CAF! <br>

-- CAFs - C onstant  A  plicaton   F  orms.<br>

-- GHCi evaluate CAFs only once, result is retained!<br>

-- :set +r Result of CAF is not retained.<br>

-- BUG  :set +r doesn't work!<br>

<br>

# <interactive>:3:1: error:
## ? No instance for (Show a) arising from a use of ‘print’ Cannot resolve unknown runtime type ‘a’

```
PS D:\001_sort_precalculated>
 ghci .\Sort.hs
GHCi, version 9.2.5: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Sort             ( Sort.hs, interpreted )
Ok, one module loaded.
ghci> :b 5
Breakpoint 0 activated at Sort.hs:5:15-32
ghci> sort [3,2,1]
Stopped in Sort.sort, Sort.hs:5:15-32
_result :: [a] = _
x :: a = _
xs :: [a] = [_,_]
[Sort.hs:5:15-32] ghci> xs

<interactive>:3:1: error:
    ? No instance for (Show a) arising from a use of ‘print’
      Cannot resolve unknown runtime type ‘a’
      Use :print or :force to determine these types
      Relevant bindings include it :: [a] (bound at <interactive>:3:1)
      These potential instances exist:
        instance Show Ordering -- Defined in ‘GHC.Show’
        instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
        instance Show Integer -- Defined in ‘GHC.Show’
        ...plus 23 others
        ...plus 13 instances involving out-of-scope types
        (use -fprint-potential-instances to see them all)
    ? In a stmt of an interactive GHCi command: print it
[Sort.hs:5:15-32] ghci> xs::[Integer]

<interactive>:4:1: error:
    ? Couldn't match type ‘a’ with ‘Integer’
      Expected: [Integer]
        Actual: [a]
      ‘a’ is an interactive-debugger skolem
    ? In the expression: xs :: [Integer]
      In an equation for ‘it’: it = xs :: [Integer]
[Sort.hs:5:15-32] ghci> :ab
ghci> sort [3,2,1::Int]
Stopped in Sort.sort, Sort.hs:5:15-32
_result :: [Int] = _
x :: Int = 3
xs :: [Int] = [2,1]
[Sort.hs:5:15-32] ghci> xs
[2,1]
[Sort.hs:5:15-32] ghci> sort "abc"
"Stopped in Sort.sort, Sort.hs:5:15-32
_result :: [Char] = _
x :: Char = 'a'
xs :: [Char] = _
... [Sort.hs:5:15-32] ghci> xs
"bc"
... [Sort.hs:5:15-32] ghci> :show context
--> sort [3,2,1::Int]
  Stopped in Sort.sort, Sort.hs:5:15-32
--> sort "abc"
  Stopped in Sort.sort, Sort.hs:5:15-32
... [Sort.hs:5:15-32] ghci> :ab
[Sort.hs:5:15-32] ghci> :ab
ghci> :q
Leaving GHCi.

```

<br>

# break & break 지우기 delete 활용법 

```

-- ghci Sort.hs
-- ❯ ghci Sort.hs
-- GHCi, version 9.2.4: https://www.haskell.org/ghc/  :? for help
-- [1 of 1] Compiling Sort             ( Sort.hs, interpreted )
-- Ok, one module loaded.
-- ghci> :br sort
-- :br sort
-- Breakpoint 0 activated at Sort.hs:4:11-12
-- Breakpoint 1 activated at Sort.hs:5:15-32
-- ghci> :br 8
-- :br 8
-- Breakpoint 2 activated at Sort.hs:8:15-17
-- ghci> :show breaks
-- :show breaks
-- [0] Sort Sort.hs:4:11-12 enabled
-- [1] Sort Sort.hs:5:15-32 enabled
-- [2] Sort Sort.hs:8:15-17 enabled
-- ghci> :delete 1,2
-- :delete 1,2
-- ghci> :delete *
-- :delete *
-- ghci> :show breaks
-- :show breaks
-- No active breakpoints.
-- ghci>
```

<br>

# Beware of Scope: Summary

- Stopping at a breakpoint doesn't change the current GHCi scope

```
- Use :module *<ModuleName>

```

<br>

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
ghci> :b Sort 5
:b Sort 5
Breakpoint 0 activated at Sort.hs:5:15-32
ghci> main
main
Stopped in Sort.sort, Sort.hs:5:15-32
_result :: [Integer] = _
x :: Integer = 6
xs :: [Integer] = [2,4,1,9]
[Sort.hs:5:15-32] ghci> :t insert
:t insert

<interactive>:1:1: error: Variable not in scope: insert
[Sort.hs:5:15-32] ghci> :t sort
:t sort
sort :: Ord a => [a] -> [a]
[Sort.hs:5:15-32] ghci> :module *Sort
:module *Sort
[Sort.hs:5:15-32] ghci> :t insert
:t insert
insert :: Ord a => a -> [a] -> [a]
[Sort.hs:5:15-32] ghci> 

```
