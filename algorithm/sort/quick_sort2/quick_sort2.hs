-- qsort_ :: Ord a => [a] -> Bool -> [a]
qsort_ [] _ = []
qsort_ (x:xs) False = qsort_ ys False ++ [x] ++ qsort_ zs False
                        where
                          ys = [a | a <- xs, a <= x]
                          zs = [b | b <- xs, b > x]
qsort_ (x:xs) True = qsort_ zs True ++ [x] ++ qsort_ ys True
                        where
                          ys = [a | a <- xs, a <= x]
                          zs = [b | b <- xs, b > x]

qsort xs = qsort_ xs False
qsortReverse xs = qsort_ xs True


a = qsort [5,2,4,3,1]
b = qsortReverse[5,2,4,3,1]
c = qsort ["abc", "cde", "ade"]
d = qsortReverse ["abc", "cde", "ade"]


-- ghci> :l quick_sort.hs
-- [1 of 1] Compiling Main             ( quick_sort.hs, interpreted )
-- Ok, one module loaded.
-- ghci> :r
-- [1 of 1] Compiling Main             ( quick_sort.hs, interpreted )
-- Ok, one module loaded.
-- ghci> a
-- [1,2,3,4,5]
-- ghci> b
-- [5,4,3,2,1]ghci> c
-- ["abc","ade","cde"]
-- ghci> d
-- ["cde","ade","abc"]