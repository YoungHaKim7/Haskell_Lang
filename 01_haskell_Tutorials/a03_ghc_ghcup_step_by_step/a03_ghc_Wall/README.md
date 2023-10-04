# Result

```bash
make r
ghc -Wall Main.hs -fforce-recomp
[1 of 2] Compiling Main             ( Main.hs, Main.o )

Main.hs:1:1: warning: [-Wmissing-signatures]
    Top-level binding with no type signature: main :: IO ()
  |
1 | main = putStrLn "Hello, Haskell"
  | ^^^^
[2 of 2] Linking Main
ld: warning: ignoring duplicate libraries: '-lm'
./Main
Hello, Haskell
```