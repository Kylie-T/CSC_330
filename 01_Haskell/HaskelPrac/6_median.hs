-- mdn :: [Int] -> Int
-- mdn [] = (-1)
-- mdn list@(x:xs) = (evenNums list) !! ((length (list)) `div` 2) 

--     where
--         evenNums :: [Int] -> Int
--         evenNums list2@(x:xs)
--             | (x `mod` 2) == 0 = result + 1
--             | otherwise = result
--             where
--                 result = 0
import Data.List (sort)
        
    mdn :: [Int] -> Int
    mdn [] ->  
    

main :: IO()
main = do
    print $ mdn []
    print $ mdn [2]
    print $ mdn [1,2,3,4,5]