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
