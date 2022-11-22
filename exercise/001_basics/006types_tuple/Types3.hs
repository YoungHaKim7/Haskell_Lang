-- https://github.com/MondayMorningHaskell/haskellings/blob/master/exercises/basics/Types3.hs
module Types3 where

tuple1 :: (Int, Int)
tuple1 = (5, -2)

tuple2 :: (Char, Bool, Double)
tuple2 = ('a', True, 9.563)

tuple3 :: (Int, Int, Bool, Bool)
tuple3 = (3,3,True, False)

tuple4 :: (String, String, String)
tuple4 = ("Hello", "Haskell", "World")

tuple5 :: (Int, String, Int, String, Double)
tuple5 = (9, "Haskell Good", 7, "Happy Day", 3.143334522)


-- $ stack repl

-- Note: No local targets specified, so a plain ghci will
--       be started with no package hiding or package
--       options.

--       You are using snapshot: lts-19.16

--       If you want to use package hiding and options,
--       then you can try one of the following:

--       * If you want to start a different project
--         configuration
--         than /Users/globalyoung/.stack/global-project/stack.yaml, then you can use
--         stack init to create a new stack.yaml for the
--         packages in the current directory.

--       * If you want to use the project configuration
--         at /Users/globalyoung/.stack/global-project/stack.yaml, then you can add to its 'packages' field.

-- Configuring GHCi with the following packages:
-- GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
-- Loaded GHCi configuration from /private/var/folders/bf/fk_kzm5n5zbfzkv31qhrglhr0000gn/T/haskell-stack-ghci/2a3bbd58/ghci-script
-- ghci> :l Types3.hs
-- [1 of 1] Compiling Types3           ( Types3.hs, interpreted )
-- Ok, one module loaded.
-- ghci> tuple1
-- (5,-2)
-- ghci> :t tuple1
-- tuple1 :: (Int, Int)
-- ghci> tuple2
-- ('a',True,9.563)
-- ghci> :t tuple2
-- tuple2 :: (Char, Bool, Double)
-- ghci> tuple3
-- (3,3,True,False)
-- ghci> :t tuple3
-- tuple3 :: (Int, Int, Bool, Bool)
-- ghci> :r
-- [1 of 1] Compiling Types3           ( Types3.hs, interpreted )
-- Ok, one module loaded.
-- ghci> tuple4
-- ("Hello","Haskell","World")
-- ghci> :t tuple4
-- tuple4 :: (String, String, String)
-- ghci> tuple5
-- (9,"Haskell Good",7,"Happy Day",3.143334522)
-- ghci> :t tuple5
-- tuple5 :: (Int, String, Int, String, Double)
-- ghci> :q
-- Leaving GHCi.
