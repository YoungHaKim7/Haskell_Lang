# pih01-4 하스켈 프로그래밍 맛보기

https://youtu.be/vZRjuJKXdD0

<br>

# stack repl

```
stack repl

Note: No local targets specified, so a plain ghci will be started with no
      package hiding or package options.

      You are using snapshot: lts-19.16

      If you want to use package hiding and options, then you can try one of
      the following:

      * If you want to start a different project configuration
        than /Users/globalyoung/.stack/global-project/stack.yaml, then you can use
        stack init to create a new stack.yaml for the packages in the current
        directory.

      * If you want to use the project configuration
        at /Users/globalyoung/.stack/global-project/stack.yaml, then you can add to its 'packages' field.

Configuring GHCi with the following packages:
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /private/var/folders/bf/fk_kzm5n5zbfzkv31qhrglhr0000gn/T/haskell-stack-ghci/2a3bbd58/ghci-script
ghci> :l quick_sort.hs
[1 of 1] Compiling Main             ( quick_sort.hs, interpreted )


ghci> :r
[1 of 1] Compiling Main             ( quick_sort.hs, interpreted )
Ok, one module loaded.
ghci> a
[1,2,3,4,5]
ghci> b

<interactive>:5:1: error: Variable not in scope: b
ghci> :r
[1 of 1] Compiling Main             ( quick_sort.hs, interpreted )
Ok, one module loaded.
ghci> b
[5,4,3,2,1]
ghci> :q
Leaving GHCi.

```
