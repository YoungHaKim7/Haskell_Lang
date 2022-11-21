actionSeqn :: [IO a] -> IO [a]
actionSeqn [] = return []
actionSeqn (act:acts) = do x <- act
                           xs <- actionSeqn acts
                           return (x:xs)
                          
                          
-- ghci> :l actions.hs
-- [1 of 1] Compiling Main             ( actions.hs, interpreted )
-- Ok, one module loaded.
-- ghci> :r
-- [1 of 1] Compiling Main             ( actions.hs, interpreted )
-- Ok, one module loaded.
-- ghci> actionSeqn [getChar, getChar, getChar]
-- abc"abc"
-- 운영체제 마다 실행 결과가 틀리다. getChar 어렵군  