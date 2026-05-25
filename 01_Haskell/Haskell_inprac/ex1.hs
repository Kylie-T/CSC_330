-- second :: [Int] -> Int
-- second [] = (-1)
-- second nums
--     | (length nums) == 1 = (-1)
--     | otherwise = nums !! 1


-- second :: [Int] -> Int
-- second [] = (-1)
-- second [_] = (-1)
-- second (f:s:rest) = s


import Data.Maybe

second :: [Int] -> Maybe Int
second [] = Nothing
second [_] = Nothing
second (f:s:rest) = Just s


-- printSecond :: Maybe Int -> IO()
-- printSecond Nothing = return()
-- printSecond (Just val) = putStrLn $ "The second item is: " ++ (show val)


-- map
-- doubleList :: [Float] -> [Float]
-- doubleList list = map (*2) list

-- doubleList :: [Float] -> [Float]
-- doubleList list = map (*2) 


-- filter
greaterThanTwo :: [Int] -> [Int]
greaterThanTwo list = 
    filter (>2) list

-- isEven :: Int -> Bool
-- isEven num = (num `mod` 2 == 0)

-- getEvenValues :: [Int] -> [Int]
-- getEvenValues list = 
--     filter isEven list

getEvenValues :: [Int] -> [Int]
getEvenValues list = 
    filter (\ num -> (num `mod` 2) == 0) list

-- -- foldl/foldr
-- total :: [Int] -> Int
-- total list = foldl (+) 0 list -- l means apply left to right, other reversed

totall :: [Int] -> Int
totall list = foldl (-) 0 list -- l means apply left to right, other reversed

totalr :: [Int] -> Int
totalr list = foldr (-) 0 list -- l means apply left to right, other reversed

main :: IO()
main = do
    -- printSecond $ second []
    -- printSecond $ second [1]
    -- printSecond $ second [1,2]
    -- printSecond $ second [1,(-1),3]

    -- print $ doubleList [8,9,2,100.2,(-5)]

    -- print $ greaterThanTwo [8,9,2,100,4,0,1,(-3)]

    -- print $ getEvenValues [8,9,2,100,4,0,1,(-3)]

    -- print $ total [8,9,2,100,4,0,1,(-3)]

    -- print $ totall [1,2,3]
    -- print $ totalr [1,2,3]