import System.Environment (getArgs)

-- function to make a value (a term in the sequence)
-- takes in the starting list and returns the next term
makeListVal :: [Int] -> [Int]
makeListVal [] = []
makeListVal (x:xs) = loop x 1 xs
    where
        -- counts how many of a number and adds the count and the number counted to make term
        loop val count [] = [count, val]
        loop val count (y:ys)
            | val == y = loop val (count + 1) ys
            | otherwise = count : val : loop y 1 ys
    

-- takes in the number of terms wanted and the starting value
-- returns a list of the terms that are themselves lists
makeWholeList :: Int -> [Int] -> [[Int]]
makeWholeList 0 _ = []
makeWholeList val list = list : makeWholeList (val - 1) (makeListVal list)
    

-- takes in the term and finds the average
average :: [Int] -> Float
average [] = 0
average list = (total list) / (fromIntegral(length list))
    where 
        -- calculates the sum of the term to find average
        total [] = 0
        total (x:xs) = (fromIntegral(x)) + total xs


-- takes in the term and average to format a string to print first 20 values in the term
toString :: [Int] -> Float -> String
toString list avg 
    | ((length list) >= 21) = assemble (show (take 20 list)) ++ ",...] : " ++ (show avg)
    | otherwise = (show list) ++ " : " ++ (show avg)
    -- where
        -- makes a list of the first twenty values of a term
assemble [] = []
assemble [x] = []
assemble (x:xs) = x : assemble xs


-- takes in the list of all the terms and prints each formatted string value of the terms
printing :: [[Int]] -> IO()
printing [] = putStr ""
printing (x:xs) = do
    putStrLn (toString x (average x))
    printing xs


-- main function setting first term, setting the list of terms, and printing everything
main = do
    args <- getArgs
    
    let firstTerm
            | (length args) > 0 = map read args
            | otherwise = [1] 

    let values = makeWholeList 30 firstTerm
    printing values
