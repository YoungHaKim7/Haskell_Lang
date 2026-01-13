module Main where

square :: Int -> Int
square x = x * x

double :: Int -> Int
double x = x * 2

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  let res_square = square 3
  print res_square

  let res_double = double 9
  print res_double

