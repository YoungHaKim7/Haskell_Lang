import Data.List
import System.IO

main = do 
  putStrLn "What is your name"
  name <- getLine
  putStrLn ("Hello world Haskell " ++ name)
