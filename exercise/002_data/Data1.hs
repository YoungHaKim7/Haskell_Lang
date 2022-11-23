-- https://wiki.haskell.org/Constructor
-- https://github.com/MondayMorningHaskell/haskellings/blob/master/exercises/data/Data1.hs
module Data1 where
import GHC.Show

data Adult = Adult String String Int String
-- data Child = Child { name:: String, age :: Int, familynum:: Int }

adult1 :: Adult
adult1 = Adult "John" "Smith" 45 "Lawyer"

adult2 :: Adult
adult2 = Adult "Jane" "Smith" 39 "Engineer"

-- child1 :: Child
-- child1 = Child "Christopher" 9 4
-- 
-- child2 :: Child
-- child2 = Child "Stephanie" 12 6
