-- smallest :: [Float] -> Float
-- smallest [] = (-1)
-- smallest [x] = x
-- smallest (h:t) = min h (smallest t)

smallest :: [Float] -> Float
smallest [] = (-1)
smallest [x] = x
smallest (h:t) 
    | h < (smallest t) = h
    | otherwise = smallestT
    where smallestT = smallest t

main :: IO()
main = do
    print $ smallest []
    print $ smallest [1,2,3,4,5]
    print $ smallest [1,2,3,4,5,0]
    print $ smallest [1,2,3,0,4,5]