total :: [Float] -> Float
total [] = (-1)
total [x] = x
total (x:xs) = x + (total xs)

main :: IO()
main = do
    print $ total []
    print $ total [2]
    print $ total [1,2,3,4,5]