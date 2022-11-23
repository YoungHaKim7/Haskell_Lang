data Shape = Circle Float Float Float
            | Rectangle Float Float Float Float
            deriving (Show)


-- ghci> :l ShowInstace.hs
-- [1 of 1] Compiling Main             ( ShowInstace.hs, interpreted )
-- Ok, one module loaded.
-- ghci> Circle 10 20 5
-- Circle 10.0 20.0 5.0
-- ghci> Rectangle 50 230 60 90
-- Rectangle 50.0 230.0 60.0 90.0
-- ghci> map (Circle 1 2) [4,5,6]
-- [Circle 1.0 2.0 4.0,Circle 1.0 2.0 5.0,Circle 1.0 2.0 6.0]
-- ghci>
