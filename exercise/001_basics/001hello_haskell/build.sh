#! bin/bash

ghc --make hello

rm *.hi
rm *.o

./hello.exe
