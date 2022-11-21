sum_ :: [Integer] -> Integer
sum_ [] = 0
sum_ (n:ns) = n + sum_ ns

a = sum_[1,2,3,4,5]


-- stack repl
-- ghci> :l flodr_sum.hs
-- [1 of 1] Compiling Main             ( flodr_sum.hs, interpreted )
-- Ok, one module loaded.
-- ghci> a
-- 15
-- ghci> :type sum_
-- sum_ :: [Integer] -> Integer
-- ghci> :type sum
-- sum :: (Foldable t, Num a) => t a -> a
-- ghci>
