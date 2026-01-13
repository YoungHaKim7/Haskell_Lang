module Main where

numbers :: [Int]
numbers = [10, 20, 30, 40]

-- Index 2 access   -- Access by index (not recommended for performance) 
value :: Int
value = numbers !! 2

squares :: [Int]
squares = map (^2) numbers

evens :: [Int]
evens = filter even numbers

total :: Int
total = sum numbers

main :: IO ()
main = do
  putStrLn "Haskell array"
  print numbers   -- [10, 20, 30, 40]

  print value

  print squares
  print (map (*3) numbers)

  print evens
  print (filter (>25) numbers)

  print total
  print (product numbers)
  print (foldl (+) 0 numbers)

  print (foldr (-) 0 numbers)

  print (head numbers)
  print (tail numbers)
  print (init numbers)
  print (last numbers)
  print (length numbers)
  print (null numbers)

  print (5 : numbers)
  print (numbers ++ [50, 60])
  print (replicate 4 7)

  print (take 3 numbers)
  print (drop 2 numbers)

  print [x*2 | x <- numbers]
  print [x | x <- numbers]

  print [x | x <- numbers, x > 25]
  print [(x, y) | x <- [1..3], y <- [10..12]] -- Cartesian product

  print (zip [1..4] "abcd")
  print (zipWith (+) numbers [1..4])

  print (reverse numbers)
  print (minimum numbers)
  print (maximum numbers)
  
