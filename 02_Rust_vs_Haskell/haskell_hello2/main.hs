import Data.List
import System.IO

data Item = Item
  { name :: String,
    price :: Double
  }
  deriving (Show)

main = do
  let cake = Item {name = "Cake", price = 1.2}

  let updatedCake = cake {price = 1.4}

  print cake
  -- Prints: Item {name = "Cake", price = 1.2}
  print updatedCake