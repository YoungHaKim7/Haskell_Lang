module Main where

add :: Int -> Int -> Int
add x y = x + y

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  let result = add 3 5
  print result

