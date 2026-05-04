rng :: Int -> Int -> [Int]
rng num1 num2 
    | num1 < num2 = num1 : (rng (num1 + 1) num2)
    | num1 > num2 = num1 : (rng (num1 - 1) num2)
    | otherwise = [num1]

main :: IO()
main = do
    print $ rng (-5) 5
    print $ rng 5 (-5)
    print $ rng 5 5
    
    
