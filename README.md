# Haskell \_ Wiki

- 공부할 자료 많음

https://wiki.haskell.org/Haskell

<br>

# FizzBuzz - You Suck at Coding [0]

## Ben Awad

[FizzBuzz - You Suck at Coding [0]](https://youtu.be/mZWsyUKwTbg)

<br>

<hr>

## 하스켈 공부하기

Learn you a Haskell ❤

http://learnyouahaskell.com/chapters

<br>

# Introduction to Cabal

https://youtu.be/a7R-2vtPLDM

<br>

# Haskell_Lang

- 설치하는 법(macOS 기준)

하스켈을 하기 위해서 설치해야할 4가지 프로그램

- ghcup

- ghc

- haskell-stack

- cabal-install

<br>

## macos 에서 homebrew로 설치하는 방법

```

brew install ghc cabal-install haskell-stack

```

# ghci 간단한 사용법

```

$ ghci

파이썬 처럼 명령 프롬프트 나옴

:l haskell-tu.hs

하스켈 파일 로드한 후

:r

메인 실행 같은 명령어 이걸 해야 내가 쓴 코드가 컴파일 되는것 같다.

그리고
maxInt
같은 내가 선언allocation 해준 변수 를 써 주면 바로 프린트 된 화면을 볼 수 있다.

ghci
GHCi, version 8.10.7: https://www.haskell.org/ghc/  :? for help
Prelude> :l haskell-tut.hs
[1 of 1] Compiling Main             ( haskell-tut.hs, interpreted )
Ok, one module loaded.


종료시키는 방법 2가지 :q  :quit

ghci> :q
Leaving GHCi.


ghci> :quit
Leaving GHCi.

```

출처: https://downloads.haskell.org/~ghc/7.4.1/docs/html/users_guide/ghci-commands.html

<br>

# Lunar Vim LSP 설치를 위해 미리 설치 필요

루나빔 Lsp를 사용하기 위해서 "ghcup" & "ghc" 2개 꼭 설치

- ghcup

- ghc

<br>

```

$ brew search ghcup
==> Formulae
ghcup ✔               ghc ✔                 ghc@9

$ brew install ghcup ghc

// 2개 꼭 설치해야함.

```

```

$ brew search cabal-install
==> Formulae
cabal-install ✔

$ brew install haskell-stack

```

## ghc 로 컴파일 하고 실행 파일 만들어서 실행하기

```
$ touch haskell-tu.hs


$ ghc --make haskell-tu


// 하면 3가지 파일이 만들어진다.

haskell-tut      실행파일
haskell-tut.hi    hi 파일명
haskell-tut.o    o 파일명


// haskell-tut.hs 하스켈 코드


$ ./haskell-tut

코드가 실행 된다.
```

<hr>

<br>

# Windows OS 에서 Haskell Install

https://www.haskell.org/ghcup/

- Windows PowerShell 에서 실행하기

```
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true

```

<br>

- 기타

```
All done!

In a new powershell or cmd.exe session, now you can...

Start a simple repl via:
  ghci

Start a new haskell project in the current directory via:
  cabal init --interactive

Install other GHC versions and tools via:
  ghcup list
  ghcup install <tool> <version>

To install system libraries and update msys2/mingw64,
open the "Mingw haskell shell"
and the "Mingw package management docs"
desktop shortcuts.

If you are new to Haskell, check out https://www.haskell.org/ghcup/steps/
Press any key to exit

```

<br>

# haskell code 예시

```
간단한 하스켈 코드

import Data.List
import System.IO

main = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++ name)

```

- haskell-tut.hs 파일을 컴파일 한 후 실행하는 방법 예시

```
$ ghc --make haskell-tut
$ ./haskell-tut
```

## 답답해서 내가 만든 영상\_\_GlobalYoung

한글하스켈Haskell강의*01*하스켈 설치 및 변수 출력install & print helloworld #haskell

[https://youtu.be/mu20HEu06mA](https://youtu.be/mu20HEu06mA)

블로그 참고

https://economiceco.tistory.com/14472

<br>

# 다른 사람의 Haskell 한글하스켈 강의

https://youtube.com/playlist?list=PL5aSjzJqCaPaoi8yC2w549FsVgvXW5xFW

<br>

<hr>

# 모든 언어를 무료로 공부할 수 있다.

출처 : stackoverflow.com
알게 된 링크

역시 갓 스택 오버플로우

https://stackoverflow.com/questions/38683512/why-git-shallow-clone-can-have-more-commits-than-depth/38683775#38683775

- Github 주소

https://github.com/EbookFoundation/free-programming-books

- EbookFoundation

https://ebookfoundation.github.io/free-programming-books/

<br>

<hr>
